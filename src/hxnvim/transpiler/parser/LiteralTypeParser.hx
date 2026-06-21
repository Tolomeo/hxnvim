package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;
using hxnvim.common.NullTools;
using hxnvim.transpiler.symbol.SymbolTools;

import hxnvim.common.Json;
import hxnvim.target.Target;
import hxnvim.transpiler.symbol.Symbol;

class FunctionTypeParser {
	private final origin:Json;
	private final params:Array<Param>;

	public function new(origin:Json, ?params:Array<Param>) {
		this.origin = origin;
		this.params = params.or([]);
	}

	function parseArguments(arguments:Array<Json>) {
		final args = arguments.map(argument -> {
			final name = argument.select('name').string();
			final type = new LiteralTypeParser(argument.select('type'), this.params).parse();

			return switch (name) {
				case '...': ({
						name: '___',
						type: LiteralType.Rest(type),
						opt: false
					});
				case n: ({
						name: n.toIdentifierName(),
						type: type,
						opt: argument.select('optional').boolean()
					});
			}
		});

		var i = args.length;
		while (--i >= 0) {
			if (args[i].type.is("Rest")) {
				continue;
			}

			final optional = args[i].opt || args[i].type.isNullable();

			if (!optional) {
				break;
			}

			args[i].opt = optional;
		}

		return args;
	}

	function parseReturns(returns:Array<Json>) {
		return switch (returns) {
			case []: LiteralType.Override("Dynamic");
			case [r]: new LiteralTypeParser(r.select('type'), this.params).parse();
			case rs:
				LiteralType.Multireturn(rs.map(r -> new LiteralTypeParser(r.select("type"), this.params).parse()));
		}
	}

	public function parse() {
		final args = this.parseArguments(this.origin.select('arguments').array());
		final ret = this.parseReturns(this.origin.select('returns').array());

		return {
			args: args,
			ret: ret,
		}
	}
}

class TableTypeParser {
	private final origin:Json;
	private final params:Array<Param>;

	public function new(origin:Json, ?params:Array<Param>) {
		this.origin = origin;
		this.params = params.or([]);
	}

	function parseTable(key:Json, value:Json) {
		return {
			key: new LiteralTypeParser(key, this.params).parse(),
			value: new LiteralTypeParser(value, this.params).parse()
		}
	}

	function parseTableStructure(fields:Array<Json>) {
		return fields.map(field -> ({
			name: field.select('name').string(),
			type: new LiteralTypeParser(field.select('type'), this.params).parse()
		}));
	}

	public function parse() {
		final indexes = this.origin.select('indexes').array();
		final fields = this.origin.select('fields').array();

		return switch ({
			fields:fields, indexes:indexes}) {
			case {fields: [], indexes: []}: LiteralType.Table(LiteralType.Override("Any"), LiteralType.Override("Any"));
			case {fields: [], indexes: [index]}:
				final table = this.parseTable(index.select('key'), index.select('value'));
				LiteralType.Table(table.key, table.value);
			case {fields: [], indexes: idxs}: throw new Exception('Error parsing table type: unimplemented table with multiple indexes');
			case {fields: flds, indexes: []}: LiteralType.TableStructure(this.parseTableStructure(flds));
			case _: throw new Exception('Error parsing table type: unimplemented table structure with indexes');
		}
	}
}

class LiteralTypeParser {
	private final type:Json;
	private final params:Array<Param>;

	public function new(type:Json, ?params:Array<Param>) {
		this.type = type;
		this.params = params.or([]);
	}

	public function parse():LiteralType {
		return switch (this.type.select('kind').string()) {
			case "unknown": LiteralType.Unknown;
			case "builtin": switch (this.type.select('value').string()) {
					case "any": LiteralType.Any;
					case "boolean": LiteralType.Boolean;
					case "function": LiteralType.AnyFunction;
					case "integer": LiteralType.Integer;
					case "nil": LiteralType.Nil;
					case "void": LiteralType.Void;
					case "number": LiteralType.Number;
					case "string": LiteralType.Str;
					case "table": LiteralType.AnyTable;
					case "userdata": LiteralType.UserData;
					case "lightuserdata": LiteralType.UserData; // NB: didn't find exactly lightuserdata in haxe.lua
					case "thread": throw new Exception('Unsupported builtin type value "thread" received');
					case v: throw new Exception('Error parsing builtin type: unimplemented "${v}"');
				};
			case "optional": LiteralType.Optional(new LiteralTypeParser(this.type.select('type'), this.params).parse());
			case "union": LiteralType.Union(this.type.select('types').array().map(t -> new LiteralTypeParser(t, this.params).parse()));
			case "array": LiteralType.Array(new LiteralTypeParser(this.type.select('items'), this.params).parse());
			case "function":
				final functionType = new FunctionTypeParser(this.type, this.params).parse();
				LiteralType.Function({
					params: [],
					args: functionType.args,
					ret: functionType.ret,
					overloads: []
				});
			case "table": new TableTypeParser(this.type, this.params).parse();
			case "numericliteral": LiteralType.NumericLiteral(this.type.select('value').string());
			case "stringliteral": LiteralType.StringLiteral(this.type.select('value').string().trimChars("'", "\""));
			case "booleanliteral": LiteralType.BooleanLiteral(this.type.select('value').string());
			case "typereference": switch (this.type.select('value').string()) {
					case paramTypeReference if (this.params.exists(param -> param.name == paramTypeReference)):
						LiteralType.GenericTypeReference(paramTypeReference);
					case typereference: LiteralType.TypeReference(typereference);
				}
			case "modulereference": LiteralType.ModuleReference(this.type.select('value').string());
			case kind: throw new Exception('Error parsing literal type: unimplemented "${kind}" kind');
		}
	}
}
