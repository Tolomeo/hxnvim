package hxnvim.transpiler.generator;

import haxe.macro.Expr;
import haxe.macro.Context;

using hxnvim.utils.StringTools;

import hxnvim.transpiler.symbol.Symbol;

class LiteralTypeGenerator {
	public function new() {}

	public function generate(type:LiteralType) {
		try {
			return switch (Context.parse('(null:${type})', (macro null).pos).expr) {
				case EParenthesis({expr: ECheckType(_, ct)}):
					ct;
				case what:
					trace(what);
					throw 'Unable to parse: ${type}';
			}
		} catch (e) {
			trace(e);
			trace(type);
			// TODO;; enable this
			// Context.warning('bad type string: `$type`', (macro null).pos);
			throw 'Unable to parse: ${type}';
		}
	}
}
