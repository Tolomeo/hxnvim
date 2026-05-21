package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;
using hxnvim.common.NullTools;

import hxnvim.common.Json;
import hxnvim.Config;
import hxnvim.target.Target;

class LiteralTypeParser {
	private final type:Json;
	private final params:Array<{name:String}>;

	public function new(type:Json, ?params:Array<{name:String}>) {
		this.type = type;
		this.params = params.or([]);
	}

	private function parseTableLiteralType(key:Json, value:Json) {
		final keyType = new LiteralTypeParser(key, this.params).parse();
		final valueType = new LiteralTypeParser(value, this.params).parse();

		return 'lua.Table<${keyType}, ${valueType}>';
	}

	private function parseLiteralTableStructure(fields:Array<Json>) {
		final entries = fields.map(field -> ({
			name: field.select('name').string(),
			type: new LiteralTypeParser(field.select('type'), this.params).parse()
		})).map(e -> '${e.name}:${e.type}');

		return '{ ${entries.join(", ")} }';
	}

	public function parse() {
		return switch (this.type.select('kind').string()) {
			case "builtin": switch (this.type.select('value').string()) {
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

			case "unknown": "Dynamic";

			case "optional": 'Null<${new LiteralTypeParser(this.type.select('type'), this.params).parse()}>';

			case "union":
				function makeUnion(members:Array<String>):String {
					return switch (members) {
						case [], [_]:
							throw new Exception('Error creating union type out of ${this.type.getValue()}');
						case [left, right]:
							'haxe.extern.EitherType<${left}, ${right}>';
						case m:
							'haxe.extern.EitherType<${m.shift()}, ${makeUnion(m)}>';
					}
				}

				switch (this.type.select('types')
					.array()
					.copy()
					.map(t -> new LiteralTypeParser(t, this.params).parse())
					.unique()) {
					case [t]: t;
					case t: makeUnion(t);
				}

			case "array": 'Array<${new LiteralTypeParser(this.type.select('items'), this.params).parse()}>';

			case "function":
				final arguments = this.type.select('arguments').array().map(argument -> switch (argument.select('name').string()) {
					case '...': '___:haxe.Rest<${new LiteralTypeParser(argument.select('type'), this.params).parse()}>';
					case argumentName: switch (argument.select('optional').boolean()) {
							case true: '?${argumentName}:${new LiteralTypeParser(argument.select('type'), this.params).parse()}';
							case false: '${argumentName}:${new LiteralTypeParser(argument.select('type'), this.params).parse()}';
						}
				});

				final return_ = switch (this.type.select('returns').array()) {
					case []: "Dynamic";
					case [r]: new LiteralTypeParser(r.select('type'), this.params).parse();
					case returns if (returns.length <= 6): Target.toHelperReference('Multireturn<${returns.map(r -> new LiteralTypeParser(r.select("type"), this.params).parse()).join(", ")}>');
					case _: throw new Exception('Unsupported number of return types for function ${this.type.getValue()}');
				}

				'(${arguments.join(", ")}) -> ${return_}';

			case "table":
				final indexes = this.type.select('indexes').array();
				final fields = this.type.select('fields').array();

				return switch ({
					fields:fields, indexes:indexes
				}) {
					case {fields: [], indexes: []}: 'lua.Table.AnyTable';
					case {fields: [], indexes: [index]}: this.parseTableLiteralType(index.select('key'), index.select('value'));
					case {fields: [], indexes: idxs}: throw new Exception('Unimplemented table with multiple indexes');
					case {fields: flds, indexes: []}: this.parseLiteralTableStructure(flds);
					case _: throw new Exception('Unimplemented table structure with indexes');
				}

			case "numericliteral": "Float";

			case "stringliteral": "String";

			case "booleanliteral": "Bool";

			case "typereference": switch (this.type.select('value').string()) {
					case paramTypeReference if (this.params.find(param -> param.name == paramTypeReference) != null): paramTypeReference;
					case typereference: Target.toTypeReference(typereference);
				}

			case "modulereference": Target.toModuleReference(this.type.select('value').string());

			case _:
				throw new Exception('Unrecognised type "${this.type.getValue()}" received');
		}
	}
}
