package transpiler.parser;

import haxe.Exception;
import haxe.Rest;
import haxe.extern.EitherType;
import transpiler.State;
import utils.Json;

using Lambda;
using transpiler.parser.ParserTools;

typedef Metadata = {name:String, ?params:Array<String>};
typedef LiteralType = String;

typedef ParsedTableProperty = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	access:Array<String>,
	type:LiteralType,
}

typedef ParsedParam = {
	name:String,
	constraints:Array<LiteralType>
}

typedef ParsedArg = {name:String, type:LiteralType, opt:Bool};
typedef ParsedReturn = LiteralType;

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
	type:LiteralType
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
	private final json:Json;

	public function new() {
		final input = State.consume(v -> v.input);
		this.json = Json.parse(input.spec, input.file);
	}

	public function parse():ParsedModule {
		final main = this.parseSymbol(this.json);

		return {
			types: [],
			main: main
		}
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
					parsedTable.fields.push(TableField.Method(this.parseFunctionType(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType)));
				case _:
					trace('${fieldName} is not a function');
			}
		}

		return parsedTable;
	}

	// TODO: inject generics into state, because they could be injected into other types rather than being used directly as argument type
	private function parseFunctionType(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, func:Json):Function {
		final params = func.select('generics').array().map(param -> {
			final name = param.select('name').string();
			final type = param.select('type');
			final constraints = switch (type.value) {
				case JsonValue.JNull: [];
				case _: [this.parseLiteralType(type)];
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
						case _: this.parseLiteralType(argument.select('type'));
					}
				case _: this.parseLiteralType(argument.select('type'));
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

		return {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			params: params,
			args: args,
			ret: "Void"
		};
	}

	private function parseLiteralType(type:Json) {
		return switch (type.select('kind').string()) {
			case "builtin": switch (type.select('value').string()) {
					case "any": "Any";
					case "boolean": "Bool";
					case "function": "haxe.Constraints.Function";
					case "integer": "Int";
					case "lightuserdata": throw new Exception('Unsupported builtin type value "lightuserdata" received');
					case "nil": "Void";
					case "void": "Void";
					case "number": "Float";
					case "string": "String";
					case "table": "lua.Table.AnyTable";
					case "thread": throw new Exception('Unsupported builtin type value "lightuserdata" received');
					case "userdata": "lua.UserData";
					case v: throw new Exception('Unexpected builtin type value "${v}" received');
				}

			case "unknown": "Any";

			case "optional": 'Null<${this.parseLiteralType(type.select('type'))}>';

			case "union":
				function makeUnion(members:Array<Json>):String {
					return switch (members) {
						case [], [_]:
							throw new Exception('Error creating union type out of ${type.getValue()}');
						case [left, right]:
							'haxe.extern.EitherType<${this.parseLiteralType(left)}, ${this.parseLiteralType(right)}>';
						case m:
							'haxe.extern.EitherType<${this.parseLiteralType(m.shift())}, ${makeUnion(m)}>';
					}
				}

				makeUnion(type.select('types').array().copy());

			case "array": 'Array<${this.parseLiteralType(type.select('items'))}>';

			case "function":
				final arguments = type.select('arguments').array().map(argument -> switch (argument.select('name').string()) {
					case '...': '___:haxe.Rest<${this.parseLiteralType(argument.select('type'))}>';
					case argumentName: switch (argument.select('optional').boolean()) {
							case true: '?${argumentName}:${this.parseLiteralType(argument.select('type'))}';
							case false: '${argumentName}:${this.parseLiteralType(argument.select('type'))}';
						}
				});
				final return_ = switch (type.select('returns').array()) {
					case []: "Any";
					case [r]: this.parseLiteralType(r.select('type'));
					case _: throw new Exception('Unimplemented multiple function returns');
				}

				'(${arguments.join(", ")}) -> ${return_}';

			case "table":
				final indexes = type.select('indexes').array().map(index -> ({
					key: this.parseLiteralType(index.select('key')),
					value: this.parseLiteralType(index.select('value'))
				}));
				final fields = type.select('fields').array().map(field -> ({
					name: field.select('name').string(),
					type: this.parseLiteralType(field.select('type'))
				}));

				return switch ({
					fields:fields, indexes:indexes
				}) {
					case {fields: [], indexes: []}: 'lua.Table.AnyTable';
					case {fields: [], indexes: [index]}: 'lua.Table<${index.key}, ${index.value}>';
					case {fields: [], indexes: idxs}: throw new Exception('Unimplemented table with multiple indexes');
					case {fields: flds, indexes: []}:
						final entries = flds.map(fld -> '${fld.name}: ${fld.type}').join(", ");
						'{ ${entries} }';
					case _: throw new Exception('Unimplemented table structure with indexes');
				}

			case "numericliteral": "Float";

			case "stringliteral": "String";

			case "typereference": 'vim.type.${type.select('value').string().toTypeName()}';

			case "modulereference": 'vim.module.${type.select('value').string().toTypeName()}';

			case _:
				throw new Exception('Unrecognised type "${type.getValue()}" received');
		}
	}
}
