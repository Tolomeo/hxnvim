package transpiler.parser;

import haxe.Exception;
import haxe.ds.Option;
import haxe.Rest;
import hxjsonast.Json;
import hxjsonast.Printer;
import transpiler.State;

using Lambda;
using hxjsonast.Tools;
using transpiler.parser.ParserTools;

function get(json:Json, selector:Rest<String>):Option<Json> {
	final keys = selector.toArray();

	if (keys.length < 1) {
		return Some(json);
	}

	final key = keys.shift();

	return switch (json.getField(key)) {
		case null:
			return None;
		case field:
			return get(field.value, ...keys);
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

typedef Function = {
	name:String,
	doc:Array<String>,
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
	doc:Array<String>,
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
		final name = switch (get(symbol, 'name')) {
			case Some(n): getString(n).toTypeName();
			case None: throw new Exception('Error retrieving symbol documentation in ${symbol.getValue()}: not found');
		}

		final doc = switch (get(symbol, 'documentation')) {
			case Some(d): getArray(d).map(i -> getString(i)).toDoc();
			case None: throw new Exception('Error retrieving symbol documentation in ${symbol.getValue()}: not found');
		}

		final access = new Array<ParsedAccess>();
		final metadata = new Array<Metadata>();

		final meta = switch (get(symbol, 'meta')) {
			case Some(k): getArray(k).map(i -> getString(i));
			case None: throw new Exception('Error retrieving symbol meta in ${symbol.getValue()}: not found');
		}

		meta.iter((m -> switch (m) {
			case "static": access.push(ParsedAccess.Static);
			case "private": access.push(ParsedAccess.Private);
			case "deprecated": metadata.push({name: "deprecated"});
			case m: throw new Exception('Meta not implemented: ${m}');
		}));

		final type = switch (get(symbol, 'type')) {
			case Some(t): t;
			case None:
				throw new Exception('Error retrieving symbol type in ${Printer.print(symbol)}: not found');
		}

		return switch (get(type, 'kind')) {
			case Some(k): switch (getString(k)) {
					case "table": ParsedSymbol.ParsedTable(this.parseTableType(name, doc, metadata, access, type));
					case u: throw new Exception('${u} not implemented');
				}
			case None: throw new Exception('Error retrieving symbol kind in ${Printer.print(type)}: not found');
		}
	}

	private function parseTableType(name:String, doc:Array<String>, meta:Array<Metadata>, access:Array<ParsedAccess>, table:Json):Table {
		final parsedTable = {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			fields: [],
		}

		final fields = switch (get(table, 'fields')) {
			case Some(f): getArray(f);
			case None: throw new Exception('Error retrieving table fields in ${table.getValue()}: not found');
		}

		for (_ => field in fields.keyValueIterator()) {
			final fieldName = switch (get(field, 'name')) {
				case Some(n): getString(n);
				case None: throw new Exception('Error retrieving field name in ${field.getValue()}: not found');
			}

			final fieldDoc = switch (get(field, 'documentation')) {
				case Some(d): getArray(d).map(i -> getString(i)).toDoc();
				case None: throw new Exception('Error retrieving field documentation in ${field.getValue()}: not found');
			}

			final fieldAccess = new Array<ParsedAccess>();
			final fieldMetadata = new Array<Metadata>();

			switch (get(field, 'meta')) {
				case Some(metas):
					getArray(metas).map(meta -> getString(meta)).iter(meta -> switch (meta) {
						case "static": fieldAccess.push(ParsedAccess.Static);
						case "private": fieldAccess.push(ParsedAccess.Private);
						case "deprecated": fieldMetadata.push({name: "deprecated"});
						case m: throw new Exception('Meta not implemented: ${m}');
					});
				case None:
					throw new Exception('Error retrieving field meta in ${field.getValue()}: not found');
			}

			final fieldType = switch (get(field, 'type')) {
				case Some(t): t;
				case None:
					throw new Exception('Error retrieving field type in ${field.getValue()}: not found');
			}

			switch (get(fieldType, 'kind')) {
				case Some(k):
					switch (getString(k)) {
						case 'function':
							parsedTable.fields.push(TableField.Method(this.parseFunctionType(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType)));
						case _:
							trace('${fieldName} is not a function');
					}
				case None:
					throw new Exception('Error retrieving field type in ${field.getValue()}: not found');
			}
		}

		return parsedTable;
	}

	private function parseFunctionType(name:String, doc:Array<String>, meta:Array<Metadata>, access:Array<ParsedAccess>, func:Json):Function {
		return {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			params: [],
			args: [],
			ret: "Void"
		};
	}
}
