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
				new MetaGenerator("native", [native]).generate();
			case _:
				throw new Exception('Invalid meta for property: ${m}');
		});
	}

	function generateProperty(property:Variable) {
		final name = property.name.toFieldName();
		final meta = name == property.name ? this.generatePropertyMeta(property.meta) : this.generatePropertyMeta([SymbolMeta.Native(property.name)].concat(property.meta));
		final access = this.generatePropertyAccess(property.access);

		return {
			meta: meta,
			access: access,
			name: name,
			doc: property.doc,
			kind: FVar(new LiteralTypeGenerator().generate(property.type)),
			pos: Context.currentPos()
		}
	}

	function generateMethodAccess(methodAccess:Array<SymbolAccess>) {
		return methodAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case SymbolAccess.Overload: AOverload;
			case symbolAccess: throw 'Unexpected method access ${symbolAccess}';
		});
	}

	function generateMethodMeta(methodMeta:Array<SymbolMeta>) {
		final methodMetas = new Array();

		methodMeta.iter(m -> switch (m) {
			case SymbolMeta.Deprecated:
				methodMetas.push(new MetaGenerator("deprecated").generate());
			case SymbolMeta.Native(native):
				methodMetas.push(new MetaGenerator("native", [native]).generate());
			case SymbolMeta.Method: // left to children to decide what to do with this
			case _:
				throw new Exception('Invalid meta for method: ${m}');
		});

		return methodMetas;
	}

	function generateMethod(method:Function) {
		final name = method.name.toFieldName();
		final meta = name == method.name ? this.generateMethodMeta(method.meta) : this.generateMethodMeta([SymbolMeta.Native(method.name)].concat(method.meta));
		final access = this.generateMethodAccess(method.access);

		return {
			meta: meta,
			access: access,
			name: name,
			doc: method.doc,
			kind: FFun({
				params: method.params.map(p -> ({
					name: p.name,
					constraints: p.constraints.map(c -> new LiteralTypeGenerator().generate(c)),
				} : TypeParamDecl)),
				args: method.args.map(a -> ({
					name: a.name,
					type: new LiteralTypeGenerator().generate(a.type),
					opt: a.opt,
				} : FunctionArg)),
				ret: new LiteralTypeGenerator().generate(method.ret)
			}),
			pos: Context.currentPos()
		}
	}

	function generateFields(fields:Array<TableField>):Array<Field> {
		return fields.map(field -> {
			return switch (field) {
				case TableField.Method(func): this.generateMethod(func);
				case TableField.Property(prop): this.generateProperty(prop);
				case s: throw new Exception('Unexpected ${s} table field received');
			}
		});
	}

	function generateMeta(tableMeta:Array<SymbolMeta>) {
		return tableMeta.map(m -> switch (m) {
			case SymbolMeta.Deprecated:
				new MetaGenerator("deprecated").generate();
			case SymbolMeta.Native(native):
				new MetaGenerator("native", [native]).generate();
			case StructInit:
				new MetaGenerator("structInit").generate();
			case _:
				throw new Exception('Invalid meta for table: ${m}');
		});
	}

	public function generate(?meta:Array<SymbolMeta>):TypeDefinition {
		meta = meta.or([]).concat(this.table.meta);

		final name = this.table.name;

		final fields = this.generateFields(this.table.fields);

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

		return {
			name: name,
			doc: this.table.doc,
			pack: [],
			kind: TDClass(),
			meta: this.generateMeta(meta),
			fields: fields,
			pos: Context.currentPos(),
			isExtern: true,
		};
	}
}

class InstanceClassGenerator extends ClassGenerator {
	override function generateMethodMeta(methodMeta:Array<SymbolMeta>) {
		final isMethod = methodMeta.contains(SymbolMeta.Method);
		final methodMetas = isMethod ? [] : [new MetaGenerator("luaDotMethod").generate()];

		methodMeta.iter(m -> switch (m) {
			case SymbolMeta.Method:
			case SymbolMeta.Deprecated:
				methodMetas.push(new MetaGenerator("deprecated").generate());
			case SymbolMeta.Native(native):
				methodMetas.push(new MetaGenerator("native", [native]).generate());
			case _:
				throw new Exception('Invalid meta for method: ${m}');
		});

		return methodMetas;
	}
}

// TODO: detect when a function is treated as a method, and automatically add the first self argument
class SingletonClassGenerator extends ClassGenerator {
	override function generatePropertyAccess(propertyAccess:Array<SymbolAccess>) {
		return [AStatic].concat(propertyAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case symbolAccess: throw 'Unexpected method access for property ${symbolAccess}';
		}));
	}

	override function generateMethodAccess(methodAccess:Array<SymbolAccess>) {
		return [AStatic].concat(methodAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case SymbolAccess.Overload: AOverload;
			case symbolAccess: throw 'Unexpected method access ${symbolAccess}';
		}));
	}
}
