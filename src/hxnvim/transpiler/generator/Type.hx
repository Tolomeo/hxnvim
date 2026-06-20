package hxnvim.transpiler.generator;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.Exception;

using hxnvim.common.StringTools;

import hxnvim.transpiler.symbol.Symbol;

class LiteralTypeGenerator {
	public function new() {}

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

	public function generateTypeString(type:LiteralType) {
		return switch (type) {
			case LiteralType.Builtin(value):this.generateBuiltinType(value);
			case LiteralType.Override(stringType): stringType;
			case _: throw new Exception('Error generating type string: unimplemented type ${type}');
		}
	}

	public function generate(type:LiteralType) {
		final typeString = this.generateTypeString(type);

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
