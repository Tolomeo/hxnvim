package transpiler.parser;

import haxe.Exception;

using utils.ArrayTools;
using utils.StringTools;

import utils.Json;
import Config;

class LiteralTypeParser {
	private final origin:Json;

	public function new(origin:Json) {
		this.origin = origin;
	}

	public function parse() {
		return switch (this.origin.select('kind').string()) {
			case "builtin": switch (this.origin.select('value').string()) {
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

			case "optional": 'Null<${new LiteralTypeParser((this.origin.select('type'))).parse()}>';

			case "union":
				function makeUnion(members:Array<String>):String {
					return switch (members) {
						case [], [_]:
							throw new Exception('Error creating union type out of ${this.origin.getValue()}');
						case [left, right]:
							'haxe.extern.EitherType<${left}, ${right}>';
						case m:
							'haxe.extern.EitherType<${m.shift()}, ${makeUnion(m)}>';
					}
				}

				switch (this.origin.select('types')
					.array()
					.copy()
					.map(t -> new LiteralTypeParser(t).parse())
					.unique()) {
					case [t]: t;
					case t: makeUnion(t);
				}

			case "array": 'Array<${new LiteralTypeParser((this.origin.select('items'))).parse()}>';

			case "function":
				final arguments = this.origin.select('arguments').array().map(argument -> switch (argument.select('name').string()) {
					case '...': '___:haxe.Rest<${new LiteralTypeParser((argument.select('type'))).parse()}>';
					case argumentName: switch (argument.select('optional').boolean()) {
							case true: '?${argumentName}:${new LiteralTypeParser((argument.select('type'))).parse()}';
							case false: '${argumentName}:${new LiteralTypeParser((argument.select('type'))).parse()}';
						}
				});

				final return_ = switch (this.origin.select('returns').array()) {
					case []: "Dynamic";
					case [r]: new LiteralTypeParser((r.select('type'))).parse();
					case returns if (returns.length <= 6): 'vim._internal.Multireturn<${returns.map(r -> new LiteralTypeParser(r.select("type")).parse()).join(", ")}>';
					case _: throw new Exception('Unsupported number of return types for function ${this.origin.getValue()}');
				}

				'(${arguments.join(", ")}) -> ${return_}';

			case "table":
				final indexes = this.origin.select('indexes').array().map(index -> ({
					key: new LiteralTypeParser((index.select('key'))).parse(),
					value: new LiteralTypeParser((index.select('value'))).parse()
				}));
				final fields = this.origin.select('fields').array().map(field -> ({
					name: field.select('name').string(),
					type: new LiteralTypeParser((field.select('type'))).parse()
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

			case "typereference": '${Config.outputPack}.type.${this.origin.select('value').string().toTypeName()}';

			case "modulereference": '${Config.outputPack}.module.${this.origin.select('value').string().toTypeName()}';

			case _:
				throw new Exception('Unrecognised type "${this.origin.getValue()}" received');
		}
	}
}
