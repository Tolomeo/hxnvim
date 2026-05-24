package hxnvim.transpiler.generator;

import haxe.Exception;
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.Expr.Field;

using hxnvim.common.NullTools;
using hxnvim.common.StringTools;

import hxnvim.target.Target.TargetType;
import hxnvim.transpiler.State;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.generator.Meta;
import hxnvim.transpiler.generator.Type;

class ClassGenerator {
	public function new() {}

	function makeMeta(name:String, ?params:Array<Expr>):MetadataEntry {
		return {name: ':$name', params: params, pos: (macro null).pos};
	}

	function generatePropertyAccess(propertyAccess:Array<SymbolAccess>) {
		return propertyAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case symbolAccess: throw 'Unexpected method access for property ${symbolAccess}';
		});
	}

	function generatePropertyMeta(propertyMeta:Array<Metadata>) {
		return propertyMeta.map(m -> new MetaGenerator().generate({name: m.name, params: m.params}));
	}

	function generateProperty(property:Variable) {
		final meta = this.generatePropertyMeta(property.meta);

		final name = property.name;

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

	function generateMethodMeta(methodMeta:Array<Metadata>) {
		return methodMeta.map(m -> new MetaGenerator().generate({name: m.name, params: m.params}));
	}

	function generateMethod(func:Function) {
		final meta = this.generateMethodMeta(func.meta);

		final name = func.name;

		final access = this.generateMethodAccess(func.access);

		return {
			meta: meta,
			access: access,
			name: name,
			doc: func.doc,
			kind: FFun({
				params: func.params.map(p -> ({
					name: p.name,
					constraints: p.constraints.map(c -> new LiteralTypeGenerator().generate(c)),
				} : TypeParamDecl)),
				args: func.args.map(a -> ({
					name: a.name,
					type: new LiteralTypeGenerator().generate(a.type),
					opt: a.opt,
				} : FunctionArg)),
				ret: new LiteralTypeGenerator().generate(func.ret)
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

	public function generate(table:Table, ?meta:Array<Metadata>):TypeDefinition {
		meta = meta.or([]).concat(table.meta);

		final name = table.name;

		final fields = this.generateFields(table.fields);

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
			doc: table.doc,
			pack: [],
			kind: TDClass(),
			meta: meta.map(m -> new MetaGenerator().generate(m)),
			fields: fields,
			pos: Context.currentPos(),
			isExtern: true,
		};
	}
}

class InstanceClassGenerator extends ClassGenerator {}

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
