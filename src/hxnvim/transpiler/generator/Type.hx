package hxnvim.transpiler.generator;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.Exception;

using hxnvim.common.StringTools;

import hxnvim.transpiler.symbol.Symbol;

class LiteralTypeGenerator {
	public function new() {}

	public function generateTypeString(type: LiteralType) {
		return switch (type) {
			case LiteralType.Override(stringType):stringType;
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
