import haxe.macro.Expr;

class AstExplorer {
	public static function main() {
		inspect();
	}

	macro static function inspect() {
		// 1. Inspecting Types (use `macro : TypeName`)
		// var arrayType = macro :Array<String>;
		var type = macro :haxe.extern.EitherType<Int, String>;
		trace(deepPrint(type));

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

	static function deepPrint(v:Dynamic, indent:String = ""):String {
		if (v == null)
			return "null";

		// Basic primitives
		if (Std.isOfType(v, String))
			return '"' + v + '"';
		if (Std.isOfType(v, Int) || Std.isOfType(v, Float) || Std.isOfType(v, Bool))
			return Std.string(v);

		// Arrays
		if (Std.isOfType(v, Array)) {
			var arr:Array<Dynamic> = v;
			if (arr.length == 0)
				return "[]";
			var nextIndent = indent + "  ";
			var items = [for (item in arr) deepPrint(item, nextIndent)];
			return "[\n" + nextIndent + items.join(",\n" + nextIndent) + "\n" + indent + "]";
		}

		// Enums (ExprDef, ComplexType, etc.)
		if (Reflect.isEnumValue(v)) {
			var constructor = Type.enumConstructor(v);
			var params = Type.enumParameters(v);
			if (params.length == 0)
				return constructor;
			var nextIndent = indent + "  ";
			var printedParams = [for (p in params) deepPrint(p, nextIndent)];
			return constructor + "(\n" + nextIndent + printedParams.join(",\n" + nextIndent) + "\n" + indent + ")";
		}

		// Anonymous Structures & Objects
		if (Reflect.isObject(v)) {
			var fields = Reflect.fields(v);
			if (fields.length == 0)
				return "{}";

			var nextIndent = indent + "  ";
			var printedFields = [];
			fields.sort(Reflect.compare); // Keeps fields alphabetically sorted

			for (f in fields) {
				if (f == "pos") {
					printedFields.push("pos: dummyPos");
				} else {
					var valStr = deepPrint(Reflect.field(v, f), nextIndent);
					printedFields.push(f + ": " + valStr);
				}
			}
			return "{\n" + nextIndent + printedFields.join(",\n" + nextIndent) + "\n" + indent + "}";
		}

		return Std.string(v);
	}
}
