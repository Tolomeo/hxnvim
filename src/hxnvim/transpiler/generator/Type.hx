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
	public function new() {}

	function generateUnknownType() {
		return "Dynamic";
	}

	function generateBuiltinType(builtin:String) {
		return switch (builtin) {
			case "any": "Any";
			case "boolean": "Bool";
			case "function": "haxe.Constraints.Function";
			case "integer": "Int";
			// NB: didn't find exactly lightuserdata in haxe.lua
			case "lightuserdata": "lua.UserData";
			case "nil": "Void";
			case "void": "Void";
			case "number": "Float";
			case "string": "String";
			case "table": "lua.Table.AnyTable";
			case "thread": throw new Exception('Unsupported builtin type value "thread" received');
			case "userdata": "lua.UserData";
			case v: throw new Exception('Error generating builtin literal type: unimplemented ${builtin}');
		}
	}

	function generateOptionalType(type:LiteralType) {
		return 'Null<${this.generateType(type)}>';
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

		final types = union.map(t -> this.generateType(t)).unique();
		final nonNullableTypes = types.filter(type -> type != "Void");
		final nonNullableUnion = switch (nonNullableTypes) {
			case [t]: t;
			case t: makeUnion(t);
		}

		return (types.length != nonNullableTypes.length) ? 'Null<${nonNullableUnion}>' : nonNullableUnion;
	}

	function generateArrayType(itemsType:LiteralType) {
		return 'Array<${this.generateType(itemsType)}>';
	}

	function generateFunctionType(signature:Signature) {
		final args = signature.args.map(argument -> switch (argument.name) {
			case '...': '___:haxe.Rest<${this.generateType(argument.type)}>';
			case argumentName: switch (argument.opt) {
					case true: '?${argumentName}:${this.generateType(argument.type)}';
					case false: '${argumentName}:${this.generateType(argument.type)}';
				}
		});

		final ret = this.generateType(signature.ret);

		return '(${args.join(", ")}) -> ${ret}';
	}

	function generateOverloadType(args:Array<Arg>, ret:LiteralType) {
		final signature = {
			params: [],
			args: args,
			ret: ret,
			overloads: []
		};

		return 'function ${this.generateFunctionType(signature).replace("->", ":")} {}';
	}

	function generateRestType(type:LiteralType) {
		return 'haxe.Rest<${this.generateType(type)}>';
	}

	function generateMultireturnType(returnTypes:Array<LiteralType>) {
		if (returnTypes.length > 6) {
			throw new Exception('Error generating multireturn type: too many values in ${returnTypes}, the maximum allowed is currently 6');
		}

		final types = returnTypes.map(r -> this.generateType(r)).padEnd(6, "Void");

		return Target.toHelperReference('Multireturn<${types.join(", ")}>');
	}

	function generateTableStructure(fields:Array<{name:String, type:LiteralType}>) {
		final entries = fields.map(field -> ({
			name: field.name,
			type: this.generateType(field.type),
			opt: field.type.isNullable()
		})).map(entry -> (entry.opt ? '?${entry.name}' : entry.name) + ':${entry.type}');

		return '{ ${entries.join(", ")} }';
	}

	function generateTableType(key:LiteralType, value:LiteralType) {
		return 'lua.Table<${this.generateType(key)}, ${this.generateType(value)}>';
	}

	function generateNumericLiteralType() {
		return "Float";
	}

	function generateStringLiteralType() {
		return "String";
	}

	function generateBooleanLiteralType() {
		return "Bool";
	}

	public function generateType(type:LiteralType) {
		return switch (type) {
			case LiteralType.Unknown: this.generateUnknownType();
			case LiteralType.Builtin(value): this.generateBuiltinType(value);
			case LiteralType.Optional(type): this.generateOptionalType(type);
			case LiteralType.Union(types): this.generateUnionType(types);
			case LiteralType.Array(itemsType): this.generateArrayType(itemsType);
			case LiteralType.Function(signature): this.generateFunctionType(signature);
			case LiteralType.Rest(type): this.generateRestType(type);
			case LiteralType.Multireturn(returnTypes): this.generateMultireturnType(returnTypes);
			case LiteralType.Table(key, value): this.generateTableType(key, value);
			case LiteralType.TableStructure(fields): this.generateTableStructure(fields);
			case LiteralType.NumericLiteral(_): this.generateNumericLiteralType();
			case LiteralType.StringLiteral(_): this.generateStringLiteralType();
			case LiteralType.BooleanLiteral(_): this.generateBooleanLiteralType();
			case LiteralType.GenericTypeReference(genericName): genericName;
			case LiteralType.TypeReference(typeName): Target.toTypeReference(typeName);
			case LiteralType.ModuleReference(moduleName): Target.toModuleReference(moduleName);
			case LiteralType.Overload(args, ret): this.generateOverloadType(args, ret);
			case LiteralType.Override(stringType): stringType;
			case _: throw new Exception('Error generating type string: unimplemented type ${type}');
		}
	}

	public function generate(type:LiteralType) {
		final typeString = this.generateType(type);

		try {
			return switch (Context.parse('(null:${typeString})', (macro null).pos).expr) {
				case EParenthesis({expr: ECheckType(_, ct)}):
					ct;
				case what:
					trace(what);
					throw 'Unable to parse: ${typeString}';
			}
		} catch (e) {
			trace(e);
			trace(type);
			// TODO;; enable this
			// Context.warning('bad type string: `$type`', (macro null).pos);
			throw 'Unable to parse: ${typeString}';
		}
	}
}
