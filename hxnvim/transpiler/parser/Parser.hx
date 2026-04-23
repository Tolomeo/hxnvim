package transpiler.parser;

import haxe.Exception;
import haxe.Rest;
import hxjsonast.Json;
import transpiler.State;

using Lambda;
using hxjsonast.Tools;
using transpiler.parser.ParserTools;

function getField(json:Json, selector:Rest<String>):Json {
	final keys = selector.toArray();

	if (keys.length < 1) {
		return json;
	}

	final key = keys.shift();

	return switch (json.getField(key)) {
		case null:
			throw new Exception('Error extracting key "${key}" from ${json.getValue()}: not found');
		case field:
			return getField(field.value, ...keys);
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

typedef Metadata = {name:String, ?params:Array<String>};
typedef ParsedType = String;

typedef ParsedTableProperty = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	access:Array<String>,
	type:ParsedType,
}

typedef ParsedParam = {
	name:String,
	constraints:Array<ParsedSymbol>
}

typedef ParsedArg = {name:String, type:ParsedType, optional:Bool};
typedef ParsedReturn = ParsedType;

enum ParsedAccess {
	Public;
	Private;
	Static;
	Overload;
}

typedef Function = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	access:Array<ParsedAccess>,
	params:Array<ParsedParam>,
	args:Array<ParsedArg>,
	ret:ParsedReturn,
}

enum TableField {
	Property(property:ParsedTableProperty);
	Method(function_:Function);
}

typedef Alias = {
	name:String,
	type:ParsedType
}

typedef Table = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	access:Array<ParsedAccess>,
	fields:Array<TableField>
}

enum ParsedSymbol {
	ParsedTable(table:Table);
	ParsedAlias(alias:Alias);
}

typedef ParsedModule = {
	types:Map<String, ParsedSymbol>,
	main:ParsedSymbol
}

class Parser {
	private final json:hxjsonast.Json;

	public function new() {
		final input = State.consume(v -> v.input);
		this.json = hxjsonast.Parser.parse(input.spec, input.file);
	}

	public function parse():ParsedModule {
		final main = this.parseSymbol(this.json);

		return {
			types: [],
			main: main
		}
	}

	private function parseSymbol(symbol:Json) {
		final name = getString(getField(symbol, 'name')).toTypeName();
		final doc = getArray(getField(symbol, 'documentation')).map(line -> getString(line)).toDoc();

		final access = new Array<ParsedAccess>();
		final metadata = new Array<Metadata>();

		final meta = getArray(getField(symbol, 'meta')).map(i -> getString(i));

		meta.iter((m -> switch (m) {
			case "static": access.push(ParsedAccess.Static);
			case "private": access.push(ParsedAccess.Private);
			case "deprecated": metadata.push({name: "deprecated"});
			case m: throw new Exception('Meta not implemented: ${m}');
		}));

		final type = getField(symbol, 'type');

		return switch (getString(getField(type, 'kind'))) {
			case "table": ParsedSymbol.ParsedTable(this.parseTableType(name, doc, metadata, access, type));
			case u: throw new Exception('${u} not implemented');
		}
	}

	private function parseTableType(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, table:Json):Table {
		final parsedTable = {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			fields: [],
		}

		final fields = getArray(getField(table, 'fields'));

		for (_ => field in fields.keyValueIterator()) {
			final fieldName = getString(getField(field, 'name'));
			final fieldDoc = getArray(getField(field, 'documentation')).map(i -> getString(i)).toDoc();
			final fieldAccess = new Array<ParsedAccess>();
			final fieldMetadata = new Array<Metadata>();

			getArray(getField(field, 'meta')).map(meta -> getString(meta)).iter(meta -> switch (meta) {
				case "static": fieldAccess.push(ParsedAccess.Static);
				case "private": fieldAccess.push(ParsedAccess.Private);
				case "deprecated": fieldMetadata.push({name: "deprecated"});
				case m: throw new Exception('Meta not implemented: ${m}');
			});

			final fieldType = getField(field, 'type');

			switch (getString(getField(fieldType, 'kind'))) {
				case 'function':
					parsedTable.fields.push(TableField.Method(this.parseFunctionType(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType)));
				case _:
					trace('${fieldName} is not a function');
			}
		}

		return parsedTable;
	}

	private function parseFunctionType(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, func:Json):Function {
		final params = getArray(getField(func, 'generics')).map(param -> ({
			name: getString(getField(param, 'name')),
			// TODO
			constraints: []
		}));

		return {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			params: params,
			args: [],
			ret: "Void"
		};
	}
}
