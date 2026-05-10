package hxnvim.utils;

import haxe.Rest;
import haxe.Exception;

// TODO array utils
using Lambda;
using hxjsonast.Tools;

typedef JsonValue = hxjsonast.Json.JsonValue;

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
}
