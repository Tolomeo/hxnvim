package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;
using hxnvim.common.NullTools;

import hxnvim.common.Json;
import hxnvim.target.Target;
import hxnvim.transpiler.symbol.Symbol;

class LiteralTypeParser {
	private final type:Json;
	private final params:Array<{name:String}>;

	public function new(type:Json, ?params:Array<{name:String}>) {
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
			case "builtin":
				LiteralType.Builtin(this.type.select('value').string());
			case "unknown": LiteralType.Unknown;
			case "optional": LiteralType.Optional(new LiteralTypeParser(this.type.select('type')).parse());
			/* case "union": this.parseUnion(this.type.select('types').array());
				case "array": this.parseArray(this.type.select('items'));
				case "function": this.parseFunction(this.type);
				case "table": this.parseTable(this.type);
				case "numericliteral": this.parseNumericLiteral();
				case "stringliteral": this.parseStringLiteral();
				case "booleanliteral": this.parseBooleanLiteral();
				case "typereference": this.parseTypeReference(this.type.select('value').string());
				case "modulereference": this.parseModuleReference(this.type.select('value').string()); */
			case _: LiteralType.Override(this.parseString());
		}
	}
}
