package hxnvim.common;

import haxe.macro.Expr.Field;

class Printer extends haxe.macro.Printer {
	override public function printFieldWithDelimiter(f:Field):String {
		return '${super.printFieldWithDelimiter(f)}\n';
	}
}
