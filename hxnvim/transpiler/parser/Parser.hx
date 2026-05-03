package transpiler.parser;

import haxe.Exception;
import haxe.Rest;
import haxe.Serializer;
import haxe.extern.EitherType;

using utils.ArrayTools;
using utils.StringTools;

import Config;
import utils.Json;
import transpiler.State;
import transpiler.symbol.Symbol;
import transpiler.symbol.Module;
import transpiler.parser.SymbolParser;

class Parser {
	private final json:Json;
	private var result:ParsedModule = null;

	public function new() {
		final input = State.consume(v -> v.input);
		this.json = Json.parse(input.spec, input.file);
	}

	public function parse():ParsedModule {
		this.result = {
			types: [],
			main: null
		}

		this.result.main = this.parseSymbol(this.json);

		return this.result;
	}

	private function parseSymbol(symbol:Json) {
		final name = symbol.select('name').string().toTypeName();
		final doc = symbol.select('documentation').array().map(line -> line.string()).toDoc();

		final access = new Array<ParsedAccess>();
		final metadata = new Array<Metadata>();

		final meta = symbol.select('meta').array().map(i -> i.string());

		meta.iter((m -> switch (m) {
			case "static": access.push(ParsedAccess.Static);
			case "private": access.push(ParsedAccess.Private);
			case "deprecated": metadata.push({name: "deprecated"});
			case m: throw new Exception('Meta not implemented: ${m}');
		}));

		final type = symbol.select('type');

		return switch (type.select('kind').string()) {
			case "table": ParsedSymbol.ParsedTable(this.parseTableSymbol(name, doc, metadata, access, type));

			case "typereference", "union", "unknown", "function", "builtin", "stringliteral", "numericliteral", "array":
				final symbol = new AliasSymbolParser(name, doc, metadata, access, type).parse();
				return ParsedSymbol.ParsedAlias(symbol);

			case "enumerator":
				final symbol = new EnumeratorSymbolParser(name, doc, metadata, access, type).parse();
				return ParsedSymbol.ParsedEnumerator(symbol);

			case u: throw new Exception('Error parsing ${name}: ${u} not implemented');
		}
	}

	/* private function parseEnumeratorSymbol(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, enumerator:Json):Enumerator {
		final fieldsJson = enumerator.select('fields').array();
		final type = switch (fieldsJson) {
			case []: throw new Exception('Error parsing enumerator "${name}": empty fields');
			case _: new LiteralTypeParser((fieldsJson[0].select('value'))).parse();
		}
		final fields = fieldsJson.fold((field:Json, _fields:Map<String, String>) -> {
			final fieldName = field.select('name').string().toTypeName();
			final fieldValue = switch (field.select('value')) {
				case v if (new LiteralTypeParser(v).parse() == type): v.select('value').string();
				case _: throw new Exception('Error parsing "${fieldName}" member of "${name}" enumerator in ${field.getValue()}: field type does not match enumerator type');
			}

			_fields.set(fieldName, fieldValue);

			return _fields;
		}, []);

		return {
			name: name,
			doc: doc,
			meta: meta,
			type: type,
			fields: fields
		}
	}*/
	private function parseTableSymbol(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, table:Json):Table {
		final parsedTable = {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			fields: [],
		}

		final fields = table.select('fields').array();

		for (_ => field in fields.keyValueIterator()) {
			final fieldName = field.select('name').string();
			final fieldDoc = field.select('documentation').array().map(line -> line.string()).toDoc();
			final fieldAccess = new Array<ParsedAccess>();
			final fieldMetadata = new Array<Metadata>();

			field.select('meta').array().map(meta -> meta.string()).iter(meta -> switch (meta) {
				case "static": fieldAccess.push(ParsedAccess.Static);
				case "private": fieldAccess.push(ParsedAccess.Private);
				case "deprecated": fieldMetadata.push({name: "deprecated"});
				case m: throw new Exception('Meta not implemented: ${m}');
			});

			final fieldType = field.select('type');

			switch (fieldType.select('kind').string()) {
				case 'function':
					switch (fieldType.select('overloads').array()) {
						case []:
							final symbol = new FunctionSymbolParser(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType).parse();
							final method = TableField.Method(symbol);
							parsedTable.fields.push(method);

						case overloads:
							final functions = new Array<Function>();

							function isEqualSignature(fn1:Function, fn2:Function) {
								return Serializer.run({args: fn1.args, ret: fn1.ret}) == Serializer.run({args: fn2.args, ret: fn2.ret});
							}

							functions.push(new FunctionSymbolParser(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType).parse());

							overloads.iter(overload_ -> {
								final fn = new FunctionSymbolParser(fieldName, fieldDoc, fieldMetadata, fieldAccess.concat([ParsedAccess.Overload]),
									overload_).parse();

								if (functions.foreach(existingFn -> !isEqualSignature(existingFn, fn))) {
									functions.push(fn);
								}
							});

							functions.iter(fn -> parsedTable.fields.push(TableField.Method(fn)));
					}
				case 'table':
					final className = fieldName.toTypeName();
					final classDoc = "";
					final classMetadata = [{name: 'private'}];
					final classAccess = [];

					this.result.types.set(className,
						ParsedSymbol.ParsedTable(this.parseTableSymbol(className, classDoc, classMetadata, classAccess, fieldType)));

					parsedTable.fields.push(TableField.Property({
						name: fieldName,
						doc: fieldDoc,
						meta: fieldMetadata,
						access: fieldAccess,
						type: className
					}));
				case 'unknown', 'modulereference', 'typereference', 'builtin', 'union', 'optional', 'array', 'booleanliteral', 'numericliteral',
					'stringliteral':
					final symbol = new AliasSymbolParser(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType).parse();
					final property = TableField.Property(symbol);
					parsedTable.fields.push(property);

				case k:
					throw new Exception('Unexpected kind "${k}" received for table "${name}" in field "${fieldName}" of type ${fieldType.getValue()}');
			}
		}

		return parsedTable;
	}
}
