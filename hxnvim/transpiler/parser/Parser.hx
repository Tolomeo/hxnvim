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
import transpiler.parser.SymbolParser;

typedef ParsedModule = {
	types:Map<String, ParsedSymbol>,
	main:ParsedSymbol
}

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
			case "typereference", "union", "unknown", "function", "builtin", "stringliteral", "numericliteral",
				"array": ParsedSymbol.ParsedAlias(this.parseAliasSymbol(name, doc, metadata, access, type));
			case "enumerator": ParsedSymbol.ParsedEnumerator(this.parseEnumeratorSymbol(name, doc, metadata, access, type));
			case u: throw new Exception('Error parsing ${name}: ${u} not implemented');
		}
	}

	private function parseEnumeratorSymbol(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, enumerator:Json):Enumerator {
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
	}

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
					parsedTable.fields.push(TableField.Property(this.parseAliasSymbol(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType)));

				case k:
					throw new Exception('Unexpected kind "${k}" received for table "${name}" in field "${fieldName}" of type ${fieldType.getValue()}');
			}
		}

		return parsedTable;
	}

	private function parseAliasSymbol(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, type:Json) {
		return {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			type: new LiteralTypeParser((type)).parse()
		}
	}

	// TODO: inject generics into state, because they could be injected into other types rather than being used directly as argument type
	/* private function parseFunctionSymbol(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, func:Json):Function {
		final params = func.select('generics').array().map(param -> {
			final name = param.select('name').string();
			final type = param.select('type');
			final constraints = switch (type.value) {
				case JsonValue.JNull: [];
				case _: [new LiteralTypeParser((type)).parse()];
			}

			return {
				name: name,
				constraints: constraints
			}
		});

		final args = func.select('arguments').array().map(argument -> {
			final name = argument.select('name').string();
			final type = switch (argument.select('type', 'kind').string()) {
				case 'typereference': switch (argument.select('type', 'value').string()) {
						case genericTypeReference if (params.find(param -> param.name == genericTypeReference) != null): genericTypeReference;
						case _: new LiteralTypeParser((argument.select('type'))).parse();
					}
				case _: new LiteralTypeParser((argument.select('type'))).parse();
			}

			return switch (name) {
				case '...': ({
						name: '___',
						type: 'haxe.Rest<${type}>',
						opt: false
					});
				case n: ({
						name: n,
						type: type,
						opt: argument.select('optional').boolean()
					});
			}
		});

		final ret = switch (func.select('returns').array()) {
			case []: "Dynamic";
			case [r]: switch (r.select('type', 'kind').string()) {
					case 'typereference': switch (r.select('type', 'value').string()) {
							case genericTypeReference if (params.find(param -> param.name == genericTypeReference) != null): genericTypeReference;
							case _: new LiteralTypeParser((r.select('type'))).parse();
						}
					case _: new LiteralTypeParser((r.select('type'))).parse();
				}
			case returns if (returns.length <= 6):
				final multireturn = returns.map(r -> switch (r.select('type', 'kind').string()) {
					case 'typereference': switch (r.select('type', 'value').string()) {
							case genericTypeReference if (params.find(param -> param.name == genericTypeReference) != null): genericTypeReference;
							case _: new LiteralTypeParser((r.select('type'))).parse();
						}
					case _: new LiteralTypeParser((r.select('type'))).parse();
				});

				'vim._internal.Multireturn<${multireturn.join(", ")}>';

			case _: throw new Exception('Unsupported number of return types for function ${func.getValue()}');
		}

		return {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			params: params,
			args: args,
			ret: ret
		};
	}*/
}
