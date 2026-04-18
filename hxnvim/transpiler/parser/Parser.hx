package transpiler.parser;

import haxe.Exception;
import haxe.ds.Option;
import hxjsonast.Json;
import hxjsonast.Printer;
import transpiler.State;

using Lambda;
using hxjsonast.Tools;

typedef ParsedMetadata = {name:String, ?params:Array<String>};
typedef ParsedType = String;

typedef ParsedTableProperty = {
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

typedef ParsedArg = {name:String, type:ParsedType, optional:Bool};
typedef ParsedReturn = ParsedType;

enum ParsedAccess {
	Public;
	Private;
	Static;
	Overload;
}

typedef ParsedTableMethod = {
	name:String,
	doc:String,
	meta:Array<ParsedMetadata>,
	access:Array<ParsedAccess>,
	params:Array<ParsedParam>,
	args:Array<ParsedArg>,
	ret:ParsedReturn,
}

enum ParsedTableField {
	Property(property:ParsedTableProperty);
	Method(method:ParsedTableMethod);
}

function query(json:Json, selector:Array<String>):Option<Json> {
	if (selector.length < 1) {
		return Some(json);
	}

	final key = selector.shift();

	return switch (json.getField(key)) {
		case null:
			return None;
		case field:
			return query(field.value, selector);
	}
}

function getString(json:Json):String {
	return switch (json.value) {
		case JString(s): s;
		case _: throw new Exception('Error extracting string value from ${json.getValue()}');
	}
}

function getArray(json:Json):Array<Json> {
	return switch (json.value) {
		case JArray(array): array;
		case _: throw new Exception('Error extracting array value from ${json.getValue()}');
	}
}

function getFields(json:Json):Array<JObjectField> {
	return switch (json.value) {
		case JObject(fields): fields;
		case _: throw new Exception('Error extracting object value from ${json.getValue()}');
	}
}

function getFieldsMap(json:Json):Map<String, Json> {
	return getFields(json).fold((field:JObjectField, fieldsMap:Map<String, Json>) -> {
		fieldsMap.set(field.name, field.value);
		return fieldsMap;
	}, []);

	/* final object:Map<String, Json> = switch (json.value) {
			case JObject(fields): fields.fold((field:JObjectField, fieldsMap:Map<String, Json>) -> {
					fieldsMap.set(field.name, field.value);
					return fieldsMap;
				}, []);
			case _: throw new Exception('Error extracting object value from ${json.getValue()}');
		}

		return object; */
}

enum ParsedSymbol {
	ParsedTable(name:String, doc:Array<String>, meta:Array<ParsedMetadata>, access:Array<ParsedAccess>, fields:Array<ParsedTableField>);
}

class Parser {
	private final json:hxjsonast.Json;

	public function new() {
		final input = State.consume(v -> v.input);
		this.json = hxjsonast.Parser.parse(input.spec, input.file);
	}

	public function parse() {
		return this.parseSymbol(this.json);
	}

	private function parseSymbol(symbol:Json) {
		final name = switch (query(symbol, ['name'])) {
			case Some(n): getString(n);
			case None: throw new Exception('Error retrieving symbol documentation in ${symbol.getValue()}: not found');
		}

		final doc = switch (query(symbol, ['documentation'])) {
			case Some(d): getArray(d).map(i -> getString(i));
			case None: throw new Exception('Error retrieving symbol documentation in ${symbol.getValue()}: not found');
		}

		final access = new Array<ParsedAccess>();
		final metadata = new Array<ParsedMetadata>();

		final meta = switch (query(symbol, ['meta'])) {
			case Some(k): getArray(k).map(i -> getString(i));
			case None: throw new Exception('Error retrieving symbol meta in ${symbol.getValue()}: not found');
		}

		meta.iter((m -> switch (m) {
			case "static": access.push(ParsedAccess.Static);
			case "private": access.push(ParsedAccess.Private);
			case "deprecated": metadata.push({name: "deprecated"});
			case m: throw new Exception('Meta not implemented: ${m}');
		}));

		final type = switch (query(symbol, ['type'])) {
			case Some(t): t;
			case None:
				throw new Exception('Error retrieving symbol type in ${Printer.print(symbol)}: not found');
		}

		return switch (query(type, ['kind'])) {
			case Some(k): switch (getString(k)) {
					case "table": this.parseTable(name, doc, metadata, access, type);
					case _: throw new Exception("NOT IMPLEMENTED");
				}
			case None: throw new Exception('Error retrieving symbol kind in ${Printer.print(type)}: not found');
		}
	}

	private function parseTable(name:String, doc:Array<String>, meta:Array<ParsedMetadata>, access:Array<ParsedAccess>, table:Json) {
		final jsonFields = switch (query(table, ['fields'])) {
			case Some(f): getArray(f).map(tableField -> getFieldsMap(tableField));
			case None: throw new Exception('Error retrieving table fields in ${table.getValue()}: not found');
		}

		return ParsedSymbol.ParsedTable(name, doc, meta, access, []);
	}
}
