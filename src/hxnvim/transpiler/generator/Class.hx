package hxnvim.transpiler.generator;

import haxe.Exception;
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.Expr.Field;

using hxnvim.common.NullTools;
using hxnvim.common.StringTools;
using hxnvim.common.ArrayTools;

import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.generator.Meta;
import hxnvim.transpiler.generator.Type;

private class ClassGenerator {
	final table:Table;

	public function new(table:Table) {
		this.table = table;
	}

	function generatePropertyAccess(propertyAccess:Array<SymbolAccess>) {
		return propertyAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case symbolAccess: throw 'Unexpected method access for property ${symbolAccess}';
		});
	}

	function generatePropertyMeta(propertyMeta:Array<SymbolMeta>) {
		return propertyMeta.map(m -> switch (m) {
			case SymbolMeta.Deprecated:
				new MetaGenerator("deprecated").generate();
			case SymbolMeta.Native(native):
				new MetaGenerator("native", [macro $v{native}]).generate();
			case SymbolMeta.Optional:
				new MetaGenerator("optional").generate();
			case _:
				throw new Exception('Invalid meta for property: ${m}');
		});
	}

	function generatePropertyDefinition(name:String, doc:String, meta:Array<MetadataEntry>, access:Array<Access>, type:ComplexType) {
		return {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			kind: FVar(type),
			pos: Context.currentPos()
		};
	}

	function generateProperty(property:Variable, opt:Bool) {
		final name = property.name.toFieldName();

		final doc = property.doc;

		final propertyMeta = property.meta.copy();
		if (name != property.name) {
			propertyMeta.unshift(SymbolMeta.Native(property.name));
		}
		if (opt) {
			propertyMeta.unshift(SymbolMeta.Optional);
		}

		final meta = this.generatePropertyMeta(propertyMeta);

		final access = this.generatePropertyAccess(property.access);

		final type = new LiteralTypeGenerator().generate(property.type);

		return this.generatePropertyDefinition(name, doc, meta, access, type);
	}

	function generateMethodAccess(methodAccess:Array<SymbolAccess>) {
		return methodAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case SymbolAccess.Overload: AOverload;
			case symbolAccess: throw 'Unexpected method access ${symbolAccess}';
		});
	}

	function generateMethodMeta(methodMeta:Array<SymbolMeta>, overloads:Array<LiteralType>) {
		final methodMetas = new Array();

		methodMeta.iter(m -> switch (m) {
			case SymbolMeta.Deprecated:
				methodMetas.push(new MetaGenerator("deprecated").generate());
			case SymbolMeta.Native(native):
				methodMetas.push(new MetaGenerator("native", [macro $v{native}]).generate());
			case SymbolMeta.Optional:
				methodMetas.push(new MetaGenerator("optional").generate());
			case SymbolMeta.Method: // it is left to overrides to decide what to do with this
			case _:
				throw new Exception('Invalid meta for method: ${m}');
		});

		overloads.iter(o -> {
			methodMetas.push(new MetaGenerator("overload", [macro $i{o}]).generate());
		});

		return methodMetas;
	}

	function generateMethodDefinition(name:String, doc:String, meta:Array<MetadataEntry>, access:Array<Access>, type:Signature) {
		return {
			meta: meta,
			access: access,
			name: name,
			doc: doc,
			kind: FFun({
				params: type.params.map(p -> ({
					name: p.name,
					constraints: p.constraints.map(c -> new LiteralTypeGenerator().generate(c)),
				} : TypeParamDecl)),
				args: type.args.map(a -> ({
					name: a.name,
					type: new LiteralTypeGenerator().generate(a.type),
					opt: a.opt,
				} : FunctionArg)),
				ret: new LiteralTypeGenerator().generate(type.ret)
			}),
			pos: Context.currentPos()
		};
	}

	function generateMethod(method:Function, opt:Bool) {
		final name = method.name.toFieldName();

		final doc = method.doc;

		final methodMeta = method.meta.copy();
		if (name != method.name) {
			methodMeta.unshift(SymbolMeta.Native(method.name));
		}
		if (opt) {
			methodMeta.unshift(SymbolMeta.Optional);
		}

		final meta = this.generateMethodMeta(methodMeta, method.type.overloads);

		final access = this.generateMethodAccess(method.access);

		final type = method.type;

		return this.generateMethodDefinition(name, doc, meta, access, type);
	}

	function generateFields(fields:Array<TableField>):Array<Field> {
		return fields.map(field -> {
			return switch (field) {
				case TableField.Method(func, opt): this.generateMethod(func, opt);
				case TableField.Property(prop, opt): this.generateProperty(prop, opt);
				case s: throw new Exception('Unexpected ${s} table field received');
			}
		});
	}

	function generateMeta(tableMeta:Array<SymbolMeta>) {
		return tableMeta.map(m -> switch (m) {
			case SymbolMeta.Deprecated:
				new MetaGenerator("deprecated").generate();
			case SymbolMeta.Native(native):
				new MetaGenerator("native", [macro $v{native}]).generate();
			case StructInit:
				new MetaGenerator("structInit").generate();
			case _:
				throw new Exception('Invalid meta for table: ${m}');
		});
	}

	function generateDefinition(name:String, doc:String, meta:Array<MetadataEntry>, fields:Array<Field>, isExtern:Bool):TypeDefinition {
		return {
			name: name,
			doc: doc,
			pack: [],
			kind: TDClass(),
			meta: meta,
			fields: fields,
			pos: Context.currentPos(),
			isExtern: isExtern,
		};
	}

	public function generate(?meta:Array<SymbolMeta>) {
		meta = meta.or([]).concat(this.table.meta);

		// Not needed? We don't have inheritance anymore
		/* final kind = switch (this.origin.parent) {
				  case None: TDClass();
				  case Some(parsedParent):
			final superClass = switch (new TypeGenerator(parsedParent).make()) {
			  case TPath(typePath): typePath;
			  case _: throw 'Cannot extact type path for parent "${parsedParent}"';
			}
			TDClass(superClass);
		}*/

		return this.generateDefinition(this.table.name, this.table.doc, this.generateMeta(meta), this.generateFields(this.table.fields), true);
	}
}

class DataClassGenerator extends ClassGenerator {
	override function generatePropertyAccess(propertyAccess:Array<SymbolAccess>) {
		return [AExtern].concat(super.generatePropertyAccess(propertyAccess));
	}

	override function generateMethodAccess(methodAccess:Array<SymbolAccess>) {
		return [AExtern].concat(super.generateMethodAccess(methodAccess));
	}

	override function generateMethodMeta(methodMeta:Array<SymbolMeta>, overloads:Array<LiteralType>) {
		final dataClassMethodMeta = new Array<MetadataEntry>();

		if (!methodMeta.contains(SymbolMeta.Method)) {
			dataClassMethodMeta.push(new MetaGenerator("luaDotMethod").generate());
		}

		return dataClassMethodMeta.concat(super.generateMethodMeta(methodMeta, overloads));
	}

	override function generateDefinition(name:String, doc:String, meta:Array<MetadataEntry>, fields:Array<Field>, _:Bool):TypeDefinition {
		return super.generateDefinition(name, doc, meta, fields, false);
	}
}

class InstanceClassGenerator extends ClassGenerator {
	override function generateMethodMeta(methodMeta:Array<SymbolMeta>, overloads:Array<LiteralType>) {
		final isMethod = methodMeta.contains(SymbolMeta.Method);
		final methodMetas = isMethod ? [] : [new MetaGenerator("luaDotMethod").generate()];

		return methodMetas.concat(super.generateMethodMeta(methodMeta, overloads));
	}
}

// TODO: detect when a function is treated as a method, and automatically add the first self argument
class SingletonClassGenerator extends ClassGenerator {
	override function generatePropertyAccess(propertyAccess:Array<SymbolAccess>) {
		return [AStatic].concat(super.generatePropertyAccess(propertyAccess));
	}

	override function generateMethodAccess(methodAccess:Array<SymbolAccess>) {
		return [AStatic].concat(super.generateMethodAccess(methodAccess));
	}
}
