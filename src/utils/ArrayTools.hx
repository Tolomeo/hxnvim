package utils;

using Lambda;
using StringTools;

class ArrayTools {
	static public final flatMap = Lambda.flatMap;

	static public function iter<T>(arr:Array<T>, predicate:(item:T) -> Void) {
		return Lambda.iter(arr, predicate);
	}

	static public function exists<T>(arr:Array<T>, predicate:(item:T) -> Bool) {
		return Lambda.exists(arr, predicate);
	}

	static public function fold<T, A>(arr:Array<T>, predicate:(item:T, acc:A) -> A, first:A):A {
		return Lambda.fold(arr, predicate, first);
	}

	static public function find<T, A>(arr:Array<T>, predicate:(item:T) -> Bool) {
		return Lambda.find(arr, predicate);
	}

	static public function last<T>(arr:Array<T>):T {
		return arr[arr.length - 1];
	}

	static public final has = Lambda.has;

	static public final foreach = Lambda.foreach;

	// https://try.haxe.org/#10690590
	static public function unique<T>(array:Array<T>):Array<T> {
		var l = [];
		for (v in array) {
			if (l.indexOf(v) == -1) { // array has not v
				l.push(v);
			}
		}
		return l;
	}

	static public function toParagraph<T>(array:Array<T>):String {
		return array.join("\n");
	}

	static public function toDoc(lines:Array<String>):String {
		return ArrayTools.toParagraph(lines).replace("*/", "*\\/");
	}
}
