package hxnvim.utils;

import haxe.Rest;
import haxe.Exception;
import haxe.DynamicAccess;

// TODO array utils
using Lambda;
using hxjsonast.Tools;

typedef JsonValue = hxjsonast.Json.JsonValue;

// https://github.com/dubspeed/mergejson/blob/main/mergejson/MergeJson.hx
private function mergeJson(left:Dynamic, right:Dynamic, ?callback:(key:String, leftVal:Dynamic, rightVal:Dynamic) -> Dynamic) {
	var result:DynamicAccess<Dynamic> = left;

	for (key in Reflect.fields(right)) {
		var rightVal:Dynamic = Reflect.field(right, key);
		var leftVal:Dynamic = Reflect.field(left, key);

		// if the right key does not exist left, then merge without asking
		// else ask for a custom resolve, or use default rules
		if (Reflect.field(left, key) == null) {
			result[key] = rightVal;
			continue;
		}

		if (callback != null) {
			var custom:Dynamic = callback(key, leftVal, rightVal);
			if (custom != null) {
				result[key] = custom;
				continue;
			}
		}

		if (Std.is(rightVal, Array) || Std.is(rightVal, Bool) || Std.is(rightVal, Float) || Std.is(rightVal, Int) || Std.is(rightVal, String)) {
			result[key] = rightVal;
		} else {
			result[key] = mergeJson(Reflect.field(left, key), rightVal);
		}

		/* // default rules, as documented
			if (Std.is(rightVal, Array)) {
				// All arrays get merged
				// { a: [1]} && {a: [2,3]} => {a: [1,2,3]}
				var left:Array<Dynamic> = Reflect.field(left, key);
				var val:Array<Dynamic> = rightVal;
				result[key] = left.concat(val);
			} else if (Std.is(rightVal, Bool) || Std.is(rightVal, Float) || Std.is(rightVal, Int) || Std.is(rightVal, String)) {
				// All "basic types" get overwritten
				// { a: 3 } && { a: 4 } => {a: 4}
				result[key] = rightVal;
			} else {
				// all is left is {}, so we recursivly parse down
				result[key] = mergeJson(Reflect.field(left, key), rightVal);
		}*/
	}

	return result;
}

@:forward
abstract Json(hxjsonast.Json) from hxjsonast.Json {
	public static function parse(json:String, file:String) {
		return new Json(hxjsonast.Parser.parse(json, file));
	}

	private function new(json:hxjsonast.Json) {
		this = json;
	}

	public function getValue() {
		return this.getValue();
	}

	public function select(selector:Rest<String>):Json {
		final keys = selector.toArray();

		if (keys.length < 1) {
			return this;
		}

		final key = keys.shift();

		return switch (this.getField(key)) {
			case null:
				throw new Exception('Error extracting key "${key}" from ${this.getValue()}: not found');
			case field:
				return new Json(field.value).select(...keys);
		}
	}

	public function string():String {
		return switch (this.value) {
			case hxjsonast.Json.JsonValue.JString(s): s;
			case v: throw new Exception('Error extracting string value from ${this.getValue()}: received ${v}');
		}
	}

	public function boolean():Bool {
		return switch (this.value) {
			case hxjsonast.Json.JsonValue.JBool(b): b;
			case v: throw new Exception('Error extracting string value from ${this.getValue()}: received ${v}');
		}
	}

	public function array():Array<Json> {
		return switch (this.value) {
			case hxjsonast.Json.JsonValue.JArray(array): array;
			case _: throw new Exception('Error extracting array value from ${this.getValue()}');
		}
	}

	public function fields():Array<hxjsonast.Json.JObjectField> {
		return switch (this.value) {
			case hxjsonast.Json.JsonValue.JObject(fields): fields;
			case _: throw new Exception('Error extracting object value from ${this.getValue()}');
		}
	}

	public function fieldsMap():Map<String, Json> {
		return abstract.fields().fold((field:hxjsonast.Json.JObjectField, fieldsMap:Map<String, hxjsonast.Json>) -> {
			fieldsMap.set(field.name, field.value);
			return fieldsMap;
		}, []);
	}

	public function merge(that:String, file:String) {
		final thisJson = haxe.Json.parse(hxjsonast.Printer.print(this));
		final thatJson = haxe.Json.parse(that);
		final merged = haxe.Json.stringify(mergeJson(thisJson, thatJson));

		return new Json(hxjsonast.Parser.parse(merged, file));
	}
}
