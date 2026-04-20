package transpiler.generator;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.Expr.Field;

using utils.NullTools;

import transpiler.parser.Parser;
import transpiler.generator.Meta;

/* import transpiler.parser.Class.ParsedClass;
	import transpiler.parser.Class.ParsedClassField;
	import transpiler.parser.Class.ParsedClassProperty;
	import transpiler.parser.Class.ParsedClassMethod;
	import transpiler.parser.Meta.ParsedMetadata;
	import transpiler.generator.Meta;
	import transpiler.generator.Type; */
class ClassGenerator {
	public function new() {}

	function makeMeta(name:String, ?params:Array<Expr>):MetadataEntry {
		return {name: ':$name', params: params, pos: (macro null).pos};
	}

	/* function makeProperty(property:ParsedClassProperty) {
			final meta = property.meta.map(m -> new MetaGenerator({name: m.name, params: m.params}).make());

			final name = property.name;

			// TODO: macro this
			final access = property.access.map(a -> switch (a) {
				case "APublic": APublic;
				case "AStatic": AStatic;
				case "APrivate": APrivate;
				case _: throw 'Unexpected property access ${a}';
			});

			return {
				meta: meta,
				access: access,
				name: name,
				doc: property.doc,
				kind: FVar(new TypeGenerator(property.type).make()),
				pos: Context.currentPos()
			}
		}

		function makeMethod(method:ParsedClassMethod) {
			final meta = method.meta.map(m -> new MetaGenerator({name: m.name, params: m.params}).make());

			final name = method.name;

			// TODO: macro this
			final access = method.access.map(a -> switch (a) {
				case "APublic": APublic;
				case "AStatic": AStatic;
				case "APrivate": APrivate;
				case "AOverload": AOverload;
				case _: throw "Unexpected method access";
			});

			return {
				meta: meta,
				access: access,
				name: name,
				doc: method.doc,
				kind: FFun({
					params: method.params.map(p -> ({
						name: p.name,
						constraints: p.constraints.map(c -> new TypeGenerator(c).make()),
					} : TypeParamDecl)),
					args: method.args.map(p -> ({
						name: p.name,
						type: new TypeGenerator(p.type).make(),
						opt: p.optional,
					} : FunctionArg)),
					ret: new TypeGenerator(method.ret).make()
				}),
				pos: Context.currentPos()
			}
	}*/
	public function generate(table:Table, ?meta:Array<ParsedMetadata>):TypeDefinition {
		meta = meta.or([]);

		final name = table.name;

		final fields:Array<Field> = [];
		/* final fields:Array<Field> = this.origin.fields.map(parsedField -> {
			return switch (parsedField) {
				case ParsedClassField.Property(parsedProperty): this.makeProperty(parsedProperty);
				case ParsedClassField.Method(parsedMethod): this.makeMethod(parsedMethod);
			}
		});*/

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
			pack: [],
			kind: TDClass(),
			meta: meta.map(m -> new MetaGenerator().generate(m)),
			fields: fields,
			pos: Context.currentPos(),
			isExtern: true,
		};
	}
}
