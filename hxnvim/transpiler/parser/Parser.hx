package transpiler.parser;

import haxe.Exception;
import haxe.Rest;
import haxe.Serializer;
import haxe.extern.EitherType;
import transpiler.State;
import utils.Json;

using Lambda;
using utils.ArrayTools;
using transpiler.parser.ParserTools;

typedef Metadata = {name:String, ?params:Array<String>};
typedef LiteralType = String;

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

typedef Variable = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	access:Array<ParsedAccess>,
	type:LiteralType,
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
	Property(variable:Variable);
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
			case u: throw new Exception('${u} not implemented');
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
						case []: parsedTable.fields.push(TableField.Method(this.parseFunctionSymbol(fieldName, fieldDoc, fieldMetadata, fieldAccess,
								fieldType)));
						case overloads:
							final functions = new Array<Function>();

							function isEqualSignature(fn1:Function, fn2:Function) {
								return Serializer.run({args: fn1.args, ret: fn1.ret}) == Serializer.run({args: fn2.args, ret: fn2.ret});
							}

							functions.push(this.parseFunctionSymbol(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType));

							overloads.iter(overload_ -> {
								final fn = this.parseFunctionSymbol(fieldName, fieldDoc, fieldMetadata, fieldAccess.concat([ParsedAccess.Overload]), overload_);

								if (functions.foreach(existingFn -> !isEqualSignature(existingFn, fn))) {
									functions.push(fn);
								}
							});

							functions.iter(fn -> parsedTable.fields.push(TableField.Method(fn)));
					}
				case 'modulereference', 'typereference', 'builtin', 'union':
					parsedTable.fields.push(TableField.Property(this.parseAliasSymbol(fieldName, fieldDoc, fieldMetadata, fieldAccess, fieldType)));
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

				case 'unknown':
					'Any';

				case k:
					throw new Exception('Unexpected kind "${k}" received for table field ${fieldType.getValue()}');
			}
		}

		return parsedTable;
	}

	private function parseAliasSymbol(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, alias:Json) {
		return {
			name: name,
			doc: doc,
			meta: meta,
			access: access,
			type: this.parseLiteralType(alias)
		}
	}

	// TODO: inject generics into state, because they could be injected into other types rather than being used directly as argument type
	private function parseFunctionSymbol(name:String, doc:String, meta:Array<Metadata>, access:Array<ParsedAccess>, func:Json):Function {
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

		final ret = switch (func.select('returns').array()) {
			case []: "Dynamic";
			case [r]: switch (r.select('type', 'kind').string()) {
					case 'typereference': switch (r.select('type', 'value').string()) {
							case genericTypeReference if (params.find(param -> param.name == genericTypeReference) != null): genericTypeReference;
							case _: this.parseLiteralType(r.select('type'));
						}
					case _: this.parseLiteralType(r.select('type'));
				}
			case returns if (returns.length <= 6):
				final multireturn = returns.map(r -> switch (r.select('type', 'kind').string()) {
					case 'typereference': switch (r.select('type', 'value').string()) {
							case genericTypeReference if (params.find(param -> param.name == genericTypeReference) != null): genericTypeReference;
							case _: this.parseLiteralType(r.select('type'));
						}
					case _: this.parseLiteralType(r.select('type'));
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
	}

	private function parseLiteralType(type:Json) {
		return switch (type.select('kind').string()) {
			case "builtin": switch (type.select('value').string()) {
					case "any": "Any";
					case "boolean": "Bool";
					case "function": "haxe.Constraints.Function";
					case "integer": "Int";
					// NB: didn't find exactly lightuserdata in haxe.lua
					case "lightuserdata": "lua.UserData";
					case "nil": "Void";
					case "void": "Void";
					case "number": "Float";
					case "string": "String";
					case "table": "lua.Table.AnyTable";
					case "thread": throw new Exception('Unsupported builtin type value "thread" received');
					case "userdata": "lua.UserData";
					case v: throw new Exception('Unexpected builtin type value "${v}" received');
				}

			case "unknown": "Any";

			case "optional": 'Null<${this.parseLiteralType(type.select('type'))}>';

			case "union":
				function makeUnion(members:Array<String>):String {
					return switch (members) {
						case [], [_]:
							throw new Exception('Error creating union type out of ${type.getValue()}');
						case [left, right]:
							'haxe.extern.EitherType<${left}, ${right}>';
						case m:
							'haxe.extern.EitherType<${m.shift()}, ${makeUnion(m)}>';
					}
				}

				switch (type.select('types').array().copy().map(t -> this.parseLiteralType(t)).unique()) {
					case [t]: t;
					case t: makeUnion(t);
				}

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
					case []: "Dynamic";
					case [r]: this.parseLiteralType(r.select('type'));
					case returns if (returns.length <= 6): 'vim._internal.Multireturn<${returns.map(r -> this.parseLiteralType(r.select("type"))).join(", ")}>';
					case _: throw new Exception('Unsupported number of return types for function ${type.getValue()}');
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

			case "booleanliteral": "Bool";

			case "typereference": 'vim.type.${type.select('value').string().toTypeName()}';

			case "modulereference": 'vim.module.${type.select('value').string().toTypeName()}';

			case _:
				throw new Exception('Unrecognised type "${type.getValue()}" received');
		}
	}
}
