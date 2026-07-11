package hxnvim.transpiler.generator;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.Exception;

using hxnvim.common.StringTools;
using hxnvim.common.ArrayTools;
using hxnvim.transpiler.symbol.SymbolTools;

import hxnvim.target.Target;
import hxnvim.transpiler.symbol.Symbol;

class LiteralTypeGenerator {
	private final origin:LiteralType;

	public function new(origin:LiteralType) {
		this.origin = origin;
	}

	function generateOptionalType(type:LiteralType) {
		return 'Null<${new LiteralTypeGenerator(type).generateAsString()}>';
	}

	function generateUnionType(union:Array<LiteralType>) {
		function makeUnion(members:Array<String>):String {
			return switch (members.copy()) {
				case [], [_]:
					throw new Exception('Error generating union type out of ${union}');
				case [left, right]:
					'haxe.extern.EitherType<${left}, ${right}>';
				case m:
					'haxe.extern.EitherType<${m.shift()}, ${makeUnion(m)}>';
			}
		}

		final types = union.map(t -> new LiteralTypeGenerator(t).generateAsString()).unique();
		final nonNullableTypes = types.filter(type -> type != "Void");
		final nonNullableUnion = switch (nonNullableTypes) {
			case [t]: t;
			case t: makeUnion(t);
		}

		return (types.length != nonNullableTypes.length) ? 'Null<${nonNullableUnion}>' : nonNullableUnion;
	}

	function generateArrayType(itemsType:LiteralType) {
		return 'lua.Table<Int, ${new LiteralTypeGenerator(itemsType).generateAsString()}>';
	}

	function generateFunctionType(signature:Signature) {
		final args = signature.args.map(argument -> switch (argument.name) {
			case '...': '___:haxe.Rest<${new LiteralTypeGenerator(argument.type).generateAsString()}>';
			case argumentName: switch (argument.opt) {
					case true: '?${argumentName}:${new LiteralTypeGenerator(argument.type).generateAsString()}';
					case false: '${argumentName}:${new LiteralTypeGenerator(argument.type).generateAsString()}';
				}
		});

		final ret = new LiteralTypeGenerator(signature.ret).generateAsString();

		return '(${args.join(", ")}) -> ${ret}';
	}

	function generateRestType(type:LiteralType) {
		return 'haxe.Rest<${new LiteralTypeGenerator(type).generateAsString()}>';
	}

	function generateMultireturnType(returnTypes:Array<LiteralType>) {
		if (returnTypes.length > 6) {
			throw new Exception('Error generating multireturn type: too many values in ${returnTypes}, the maximum allowed is currently 6');
		}

		final types = returnTypes.map(r -> switch (r) {
			case LiteralType.Void: Target.toHelperReference("Nothing");
			case LiteralType.Nil: Target.toHelperReference("Nothing");
			case r: new LiteralTypeGenerator(r).generateAsString();
		}).padEnd(6, Target.toHelperReference("Nothing"));

		return Target.toHelperReference('Multireturn<${types.join(", ")}>');
	}

	function generateTableStructure(fields:Array<{name:String, type:LiteralType}>) {
		final entries = fields.map(field -> ({
			name: field.name,
			type: new LiteralTypeGenerator(field.type).generateAsString(),
			opt: field.type.isNullable()
		})).map(entry -> (entry.opt ? '?${entry.name}' : entry.name) + ':${entry.type}');

		return '{ ${entries.join(", ")} }';
	}

	function generateTableType(key:LiteralType, value:LiteralType) {
		return 'lua.Table<${new LiteralTypeGenerator(key).generateAsString()}, ${new LiteralTypeGenerator(value).generateAsString()}>';
	}

	public function generateAsString() {
		return switch (this.origin) {
			case LiteralType.Unknown: "Dynamic";
			case LiteralType.Any: "Any";
			case LiteralType.Boolean: "Bool";
			case LiteralType.AnyFunction: "haxe.Constraints.Function";
			case LiteralType.Integer: "Int";
			case LiteralType.UserData: "lua.UserData";
			case LiteralType.Nil: "Void";
			case LiteralType.Void: "Void";
			case LiteralType.Number: "Float";
			case LiteralType.Str: "String";
			case LiteralType.AnyTable: "lua.Table.AnyTable";
			case LiteralType.NumericLiteral(_): "Float";
			case LiteralType.StringLiteral(_): "String";
			case LiteralType.BooleanLiteral(_): "Bool";
			case LiteralType.Optional(type): this.generateOptionalType(type);
			case LiteralType.Union(types): this.generateUnionType(types);
			case LiteralType.Array(itemsType): this.generateArrayType(itemsType);
			case LiteralType.Function(signature): this.generateFunctionType(signature);
			case LiteralType.Rest(type): this.generateRestType(type);
			case LiteralType.Multireturn(returnTypes): this.generateMultireturnType(returnTypes);
			case LiteralType.Table(key, value): this.generateTableType(key, value);
			case LiteralType.TableStructure(fields): this.generateTableStructure(fields);
			case LiteralType.GenericTypeReference(genericName): genericName;
			case LiteralType.AnnotationReference(typeName): Target.toTypeReference(typeName);
			case LiteralType.ModuleReference(moduleName): Target.toModuleReference(moduleName);
			case LiteralType.Override(stringType): stringType;
			case _: throw new Exception('Error generating type string: unimplemented type ${this.origin}');
		}
	}

	public function generate() {
		switch (this.origin) {
			case LiteralType.Unknown:
				return ComplexType.TPath({name: "Dynamic", params: [], pack: []});
			case LiteralType.Any:
				return ComplexType.TPath({name: "Any", params: [], pack: []});
			case LiteralType.Boolean:
				return ComplexType.TPath({name: "Bool", params: [], pack: []});
			case LiteralType.AnyFunction:
				return ComplexType.TPath({
					name: "Constraints",
					params: [],
					sub: "Function",
					pack: ["haxe"]
				});
			case LiteralType.Integer:
				return ComplexType.TPath({name: "Int", params: [], pack: []});
			case LiteralType.UserData:
				return ComplexType.TPath({name: "UserData", params: [], pack: ["lua"]});
			case LiteralType.Nil:
				return ComplexType.TPath({name: "Void", params: [], pack: []});
			case LiteralType.Void:
				return ComplexType.TPath({name: "Void", params: [], pack: []});
			case LiteralType.Number:
				return ComplexType.TPath({name: "Float", params: [], pack: []});
			case LiteralType.Str:
				return ComplexType.TPath({name: "String", params: [], pack: []});
			case LiteralType.AnyTable:
				return ComplexType.TPath({
					name: "Table",
					params: [],
					sub: "AnyTable",
					pack: ["lua"]
				});
			case LiteralType.NumericLiteral(_):
				return ComplexType.TPath({name: "Float", params: [], pack: []});
			case LiteralType.StringLiteral(_):
				return ComplexType.TPath({name: "String", params: [], pack: []});
			case LiteralType.BooleanLiteral(_):
				return ComplexType.TPath({name: "Bool", params: [], pack: []});
			case LiteralType.Optional(type):
				return ComplexType.TPath({
					name: "Null",
					params: [TypeParam.TPType(new LiteralTypeGenerator(type).generate())],
					pack: []
				});
			default:
		}

		final asString = this.generateAsString();

		try {
			return switch (Context.parse('(null:${asString})', (macro null).pos).expr) {
				case EParenthesis({expr: ECheckType(_, ct)}):
					ct;
				case what:
					trace(what);
					throw 'Unable to parse: ${asString}';
			}
		} catch (e) {
			trace(e);
			trace(this.origin);
			// TODO;; enable this
			// Context.warning('bad type string: `$type`', (macro null).pos);
			throw 'Unable to parse: ${asString}';
		}
	}
}
