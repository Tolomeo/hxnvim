package transpiler.parser;

import transpiler.symbol.Module.ParsedModule;
import haxe.Exception;
import haxe.Serializer;

using utils.ArrayTools;
using utils.StringTools;

import transpiler.symbol.Symbol;
import transpiler.parser.LiteralTypeParser;
import transpiler.parser.MetadataParser;
import utils.Json;

class FunctionSymbolParser {
	private final name:String;
	private final doc:String;
	private final meta:Array<Metadata>;
	private final access:Array<ParsedAccess>;
	private final origin:Json;

	public function new(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, origin:Json) {
		this.name = name;
		this.doc = doc;
		this.meta = meta;
		this.access = access;
		this.origin = origin;
	}

	// TODO: inject generics into state, because they could be injected into other types rather than being used directly as argument type
	public function parse() {
		final params = this.origin.select('generics').array().map(param -> {
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

		final args = this.origin.select('arguments').array().map(argument -> {
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

		final ret = switch (this.origin.select('returns').array()) {
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

			case _: throw new Exception('Unsupported number of return types for function ${this.origin.getValue()}');
		}

		return {
			name: this.name,
			doc: this.doc,
			meta: this.meta,
			access: this.access,
			params: params,
			args: args,
			ret: ret
		};
	}
}

class AliasSymbolParser {
	private final name:String;
	private final doc:String;
	private final meta:Array<Metadata>;
	private final access:Array<ParsedAccess>;
	private final origin:Json;

	public function new(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, origin:Json) {
		this.name = name;
		this.doc = doc;
		this.meta = meta;
		this.access = access;
		this.origin = origin;
	}

	public function parse() {
		return {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			type: new LiteralTypeParser(this.origin).parse()
		}
	}
}

class EnumeratorSymbolParser {
	private final name:String;
	private final doc:String;
	private final meta:Array<Metadata>;
	private final access:Array<ParsedAccess>;
	private final origin:Json;

	public function new(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, origin:Json) {
		this.name = name;
		this.doc = doc;
		this.meta = meta;
		this.access = access;
		this.origin = origin;
	}

	public function parse() {
		final fieldsJson = this.origin.select('fields').array();
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
}

class TableSymbolParser {
	private final name:String;
	private final doc:String;
	private final meta:Array<Metadata>;
	private final access:Array<ParsedAccess>;
	private final origin:Json;

	public function new(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, origin:Json) {
		this.name = name;
		this.doc = doc;
		this.meta = meta;
		this.access = access;
		this.origin = origin;
	}

	public function parse(module:ParsedModule) {
		final parsedTable = {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			fields: [],
		}

		final fields = this.origin.select('fields').array();

		for (_ => field in fields.keyValueIterator()) {
			final fieldName = field.select('name').string();
			final fieldDoc = field.select('documentation').array().map(line -> line.string()).toDoc();
			final fieldAccess = new AccessParser(field.select('meta')).parse();
			final fieldMetadata = new MetaParser(field.select('meta')).parse();

			/* field.select('meta').array().map(meta -> meta.string()).iter(meta -> switch (meta) {
				case "static": fieldAccess.push(ParsedAccess.Static);
				case "private": fieldAccess.push(ParsedAccess.Private);
				case "deprecated": fieldMetadata.push({name: "deprecated"});
				case m: throw new Exception('Meta not implemented: ${m}');
			}); */

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
					final classSymbol = new TableSymbolParser(className, "", [{name: 'private'}], [], fieldType).parse(module);

					module.types.set(className, ParsedSymbol.ParsedTable(classSymbol));

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
					parsedTable.fields.push(TableField.Property(symbol));

				case k:
					throw new Exception('Unexpected kind "${k}" received for table "${name}" in field "${fieldName}" of type ${fieldType.getValue()}');
			}
		}

		return parsedTable;
	}
}
