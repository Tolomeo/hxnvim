package hxnvim.transpiler.parser;

import haxe.Exception;
import haxe.Serializer;

using hxnvim.utils.ArrayTools;
using hxnvim.utils.StringTools;

import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.symbol.Module;
import hxnvim.transpiler.parser.LiteralTypeParser;
import hxnvim.transpiler.parser.MetadataParser;
import hxnvim.utils.Json;

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
				// TODO: support for generic values referencing previous generics
				case _: [new LiteralTypeParser(type).parse()];
			}

			return {
				name: name,
				constraints: constraints
			}
		});

		final args = this.origin.select('arguments').array().map(argument -> {
			final name = argument.select('name').string();
			final type = new LiteralTypeParser(argument.select('type'), params).parse();

			return switch (name) {
				case '...': ({
						name: '___',
						type: 'haxe.Rest<${type}>',
						opt: false
					});
				case n: ({
						name: n.toIdentifierName(),
						type: type,
						opt: argument.select('optional').boolean()
					});
			}
		});

		final ret = switch (this.origin.select('returns').array()) {
			case []: "Dynamic";
			case [r]: new LiteralTypeParser(r.select('type'), params).parse();
			case returns if (returns.length <= 6):
				final multireturn = returns.map(r -> new LiteralTypeParser(r.select('type'), params).parse());

				'${Config.outputPack}.helper.Multireturn<${multireturn.join(", ")}>';

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
				case v if (new LiteralTypeParser(v).parse() == type): v.select('value').string().trimChars("'", "\"");
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
			name: this.name,
			doc: this.doc,
			meta: this.meta,
			access: this.access,
			fields: [],
		}

		final fields = this.origin.select('fields').array();

		for (_ => field in fields.keyValueIterator()) {
			final fieldJsonName = field.select('name').string();
			final fieldName = fieldJsonName.toFieldName();
			final fieldDoc = field.select('documentation').array().map(line -> line.string()).toDoc();
			final fieldAccess = new AccessParser(field.select('meta')).parse();
			final fieldMetadata = switch (fieldJsonName == fieldName) {
				case true: new MetaParser(field.select('meta')).parse();
				case false: [MetaParser.create('native', [fieldJsonName])].concat(new MetaParser(field.select('meta')).parse());
			}
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
					final classSymbol = new TableSymbolParser(className, "", [MetaParser.create('private')], [], fieldType).parse(module);

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
					throw new Exception('Unexpected kind "${k}" received for table "${fieldJsonName}" in field "${fieldName}" of type ${fieldType.getValue()}');
			}
		}

		return parsedTable;
	}
}
