package transpiler.generator;

import haxe.Exception;
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.Expr.Field;

using utils.NullTools;
using utils.StringTools;

import transpiler.parser.Parser;
import transpiler.generator.Meta;
import transpiler.generator.Type;

class ClassGenerator {
	public function new() {}

	function makeMeta(name:String, ?params:Array<Expr>):MetadataEntry {
		return {name: ':$name', params: params, pos: (macro null).pos};
	}

	function makeProperty(property:Variable) {
		final meta = property.meta.map(m -> new MetaGenerator().generate({name: m.name, params: m.params}));

		final name = property.name;

		// TODO: macro this
		final access = property.access.map(a -> switch (a) {
			case ParsedAccess.Public: APublic;
			case ParsedAccess.Static: AStatic;
			case ParsedAccess.Private: APrivate;
			case _: throw 'Unexpected method access for property ${property}';
		});

		return {
			meta: meta,
			access: access,
			name: name,
			doc: property.doc,
			kind: FVar(new TypeGenerator().generate(property.type)),
			pos: Context.currentPos()
		}
	}

	function makeMethod(func:Function) {
		final meta = func.meta.map(m -> new MetaGenerator().generate({name: m.name, params: m.params}));

		final name = func.name;

		// TODO: macro this
		final access = func.access.map(a -> switch (a) {
			case ParsedAccess.Public: APublic;
			case ParsedAccess.Static: AStatic;
			case ParsedAccess.Private: APrivate;
			case ParsedAccess.Overload: AOverload;
			case _: throw "Unexpected method access";
		});

		return {
			meta: meta,
			access: access,
			name: name,
			doc: func.doc,
			kind: FFun({
				params: func.params.map(p -> ({
					name: p.name,
					constraints: p.constraints.map(c -> new TypeGenerator().generate(c)),
				} : TypeParamDecl)),
				args: func.args.map(a -> ({
					name: a.name,
					type: new TypeGenerator().generate(a.type),
					opt: a.opt,
				} : FunctionArg)),
				ret: new TypeGenerator().generate(func.ret)
			}),
			pos: Context.currentPos()
		}
	}

	public function generate(table:Table, ?meta:Array<Metadata>):TypeDefinition {
		meta = meta.or([]);

		final name = table.name;

		final fields:Array<Field> = table.fields.map(parsedField -> {
			return switch (parsedField) {
				// case TableField.Property(parsedProperty): this.makeProperty(parsedProperty);
				case TableField.Method(func): this.makeMethod(func);
				case TableField.Property(prop): this.makeProperty(prop);
				case u: throw new Exception('Unimplementyed ${u} table field generator');
			}
		});

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
