package transpiler.parser;

import hxjsonast.*;
import transpiler.State;

class Parser {
	private final json:hxjsonast.Json;

	public function new() {
		final input = State.consume(v -> v.input);
		this.json = hxjsonast.Parser.parse(input.spec, input.file);
	}

	public function parse() {
		trace(this.json.pos.file);
		switch (json.value) {
			case JNull:
				trace('null!');
			case JString(string):
				trace('string!');
			case JBool(bool):
				trace('boolean!');
			case JNumber(number):
				trace('number!');
			case JArray(values):
				trace('array!');
			case JObject(fields):
				for (field in fields) {
					trace(field.name);
				}
		}
	}
}
