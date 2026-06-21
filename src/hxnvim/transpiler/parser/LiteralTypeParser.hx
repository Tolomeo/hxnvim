package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;
using hxnvim.common.NullTools;

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
			final type = new LiteralTypeParser(argument.select('type'), this.params).parseString();

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

		var i = args.length;
		while (--i >= 0) {
			if (args[i].type.startsWith("haxe.Rest<")) {
				continue;
			}

			final optional = args[i].opt || args[i].type.startsWith("Null<");

			if (!optional) {
				break;
			}

			args[i].opt = optional;
		}

		return args.map(a -> ({
			name: a.name,
			type: LiteralType.Override(a.type),
			opt: a.opt
		}));
	}

	function parseReturns(returns:Array<Json>) {
		return switch (returns) {
			case []: LiteralType.Override("Dynamic");
			case [r]: LiteralType.Override(new LiteralTypeParser(r.select('type'), this.params).parseString());
			case rs:
				LiteralType.Multireturn(rs.map(r -> LiteralType.Override(new LiteralTypeParser(r.select("type"), this.params).parseString()))
					.padEnd(6, LiteralType.Override("Void")));
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

	function parseTableLiteralType(key:Json, value:Json) {
		final keyType = new LiteralTypeParser(key, this.params).parseString();
		final valueType = new LiteralTypeParser(value, this.params).parseString();

		return 'lua.Table<${keyType}, ${valueType}>';
	}

	function parseLiteralTableStructure(fields:Array<Json>) {
		final entries = fields.map(field -> ({
			name: field.select('name').string(),
			type: new LiteralTypeParser(field.select('type'), this.params).parseString()
		})).map(e -> '${e.name}:${e.type}');

		return '{ ${entries.join(", ")} }';
	}

	function parseBuiltin(builtin:String) {
		return switch (this.type.select('value').string()) {
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
	}

	function parseOptional(optional:Json) {
		return 'Null<${new LiteralTypeParser(optional, this.params).parseString()}>';
	}

	function parseUnknown() {
		return "Dynamic";
	}

	function parseUnion(union:Array<Json>) {
		function makeUnion(members:Array<String>):String {
			return switch (members.copy()) {
				case [], [_]:
					throw new Exception('Error creating union type out of ${this.type.getValue()}');
				case [left, right]:
					'haxe.extern.EitherType<${left}, ${right}>';
				case m:
					'haxe.extern.EitherType<${m.shift()}, ${makeUnion(m)}>';
			}
		}

		final types = union.map(t -> new LiteralTypeParser(t, this.params).parseString()).unique();
		final nonNullableTypes = types.filter(type -> type != "Void");
		final nonNullableUnion = switch (nonNullableTypes) {
			case [t]: t;
			case t: makeUnion(t);
		}

		return (types.length != nonNullableTypes.length) ? 'Null<${nonNullableUnion}>' : nonNullableUnion;
	}

	function parseArray(items:Json) {
		return 'Array<${new LiteralTypeParser(items, this.params).parseString()}>';
	}

	function parseFunction(func:Json) {
		final arguments = func.select('arguments').array().map(argument -> switch (argument.select('name').string()) {
			case '...': '___:haxe.Rest<${new LiteralTypeParser(argument.select('type'), this.params).parseString()}>';
			case argumentName: switch (argument.select('optional').boolean()) {
					case true: '?${argumentName}:${new LiteralTypeParser(argument.select('type'), this.params).parseString()}';
					case false: '${argumentName}:${new LiteralTypeParser(argument.select('type'), this.params).parseString()}';
				}
		});

		final return_ = switch (func.select('returns').array()) {
			case []: "Dynamic";
			case [r]: new LiteralTypeParser(r.select('type'), this.params).parseString();
			case r if (r.length > 6): throw new Exception('Unsupported number of return types for function ${this.type.getValue()}');
			case rs:
				final returns = rs.map(r -> new LiteralTypeParser(r.select("type"), this.params).parseString()).padEnd(6, "Void");
				Target.toHelperReference('Multireturn<${returns.join(", ")}>');
		}

		return '(${arguments.join(", ")}) -> ${return_}';
	}

	function parseTable(table:Json) {
		final indexes = table.select('indexes').array();
		final fields = table.select('fields').array();

		return switch ({
			fields:fields, indexes:indexes}) {
			case {fields: [], indexes: []}: 'lua.Table.AnyTable';
			case {fields: [], indexes: [index]}: this.parseTableLiteralType(index.select('key'), index.select('value'));
			case {fields: [], indexes: idxs}: throw new Exception('Unimplemented table with multiple indexes');
			case {fields: flds, indexes: []}: this.parseLiteralTableStructure(flds);
			case _: throw new Exception('Unimplemented table structure with indexes');
		}
	}

	function parseNumericLiteral() {
		return "Float";
	}

	function parseStringLiteral() {
		return "String";
	}

	function parseBooleanLiteral() {
		return "Bool";
	}

	function parseTypeReference(reference:String) {
		return switch (reference) {
			case paramTypeReference if (this.params.find(param -> param.name == paramTypeReference) != null): paramTypeReference;
			case typereference: Target.toTypeReference(typereference);
		}
	}

	function parseModuleReference(reference:String) {
		return Target.toModuleReference(reference);
	}

	public function parseString() {
		return switch (this.type.select('kind').string()) {
			case "builtin": this.parseBuiltin(this.type.select('value').string());
			case "unknown": this.parseUnknown();
			case "optional": this.parseOptional(this.type.select('type'));
			case "union": this.parseUnion(this.type.select('types').array());
			case "array": this.parseArray(this.type.select('items'));
			case "function": this.parseFunction(this.type);
			case "table": this.parseTable(this.type);
			case "numericliteral": this.parseNumericLiteral();
			case "stringliteral": this.parseStringLiteral();
			case "booleanliteral": this.parseBooleanLiteral();
			case "typereference": this.parseTypeReference(this.type.select('value').string());
			case "modulereference": this.parseModuleReference(this.type.select('value').string());
			case _:
				throw new Exception('Unrecognised type "${this.type.getValue()}" received');
		}
	}

	public function parse():LiteralType {
		return switch (this.type.select('kind').string()) {
			case "builtin": LiteralType.Builtin(this.type.select('value').string());
			case "unknown": LiteralType.Unknown;
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
			case "table": new TableTypeParser(this.type).parse();
			case "numericliteral": LiteralType.NumericLiteral(this.type.select('value').string());
			case "stringliteral": LiteralType.StringLiteral(this.type.select('value').string().trimChars("'", "\""));
			case "booleanliteral": LiteralType.BooleanLiteral(this.type.select('value').string());
			case "typereference": switch (this.type.select('value').string()) {
					case paramTypeReference if (this.params.exists(param -> param.name == paramTypeReference)):
						LiteralType.GenericTypeReference(paramTypeReference);
					case typereference: LiteralType.TypeReference(typereference);
				}
			case "modulereference": LiteralType.ModuleReference(this.type.select('value').string());
			case _: LiteralType.Override(this.parseString());
		}
	}
}
