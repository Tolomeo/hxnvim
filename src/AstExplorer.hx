import haxe.macro.Expr;

class AstExplorer {
	public static function main() {
		inspect();
	}

	macro static function inspect() {
		// 1. Inspecting Types (use `macro : TypeName`)
		// var arrayType = macro :Array<String>;
		var arrayType = macro :String;
		trace(arrayType);

		// 2. Inspecting Expressions (use `macro expr`)
		/* var funcExpr = macro return {};
		Sys.println("\n--- return {} AST ---");
		trace(funcExpr); */

		// 3. Inspecting Class Fields
		/* var classDef = macro class {
			public var name:String;
		};
		Sys.println("\n--- Class Field AST ---");
		trace(classDef.fields); */

		return macro null;
	}
}
