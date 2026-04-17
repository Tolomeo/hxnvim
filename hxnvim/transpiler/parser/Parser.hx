package transpiler.parser;

using Lambda;

import haxe.Exception;
import haxe.ds.Option;
import hxjsonast.Json;
import hxjsonast.Printer;
import transpiler.State;

typedef ParsedMetadata = {name:String, ?params:Array<String>};
typedef ParsedType = String;

typedef ParsedClassProperty = {
	name:String,
	doc:String,
	meta:Array<ParsedMetadata>,
	access:Array<String>,
	type:ParsedType,
}

typedef ParsedParam = {
	name:String,
	constraints:Array<ParsedType>
}

typedef ParsedClassMethodArg = {name:String, type:ParsedType, optional:Bool};
typedef ParsedClassMethodReturn = ParsedType;

typedef ParsedClassMethod = {
	name:String,
	doc:String,
	meta:Array<ParsedMetadata>,
	access:Array<String>,
	params:Array<ParsedParam>,
	args:Array<ParsedClassMethodArg>,
	ret:ParsedClassMethodReturn,
}

enum ParsedClassField {
	Property(property:ParsedClassProperty);
	Method(method:ParsedClassMethod);
}

typedef ParsedClass = {
	name:String,
	fields:Array<ParsedClassField>
}

class Parser {
	private final json:hxjsonast.Json;

	public function new() {
		final input = State.consume(v -> v.input);
		this.json = hxjsonast.Parser.parse(input.spec, input.file);
	}

	private function query(json:Json, selector:Array<String>):Option<Json> {
		if (selector.length < 1) {
			return Some(json);
		}

		final key = selector.shift();

		switch (json.value) {
			case JObject(fields):
				switch (fields.find(f -> f.name == key)) {
					case null:
						return None;
					case field:
						return this.query(field.value, selector);
				}
			case _:
				throw new Exception('Cannot query a non object json ${Printer.print(json)} at position ${json.pos.file}, ${json.pos.min}-${json.pos.max}');
		}
	}

	public function parse() {
		return this.parseSymbol(this.json);
	}

	private function parseSymbol(json:Json) {
		final type = switch (this.query(this.json, ['type'])) {
			case Some(t): t;
			case None:
				throw new Exception('Error retrieving symbol type in ${Printer.print(this.json)}: not found');
		}

		final kind = switch (this.query(type, ['kind'])) {
			case Some(k): switch (k.value) {
					case JString(s): s;
					case _:
						throw new Exception('Error retrieving symbol type in ${Printer.print(this.json)}: not a string');
				};
			case None:
				throw new Exception('Error retrieving symbol kind in ${Printer.print(type)}: not found');
		}

		return switch (kind) {
			case "table":
				this.parseTable(type);
			case _:
				trace("NOT IMPLEMENTED");
		}
	}

	private function parseTable(table:Json) {
		trace("Parsing table");
	}
}
