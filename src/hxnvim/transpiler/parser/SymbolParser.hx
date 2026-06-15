package hxnvim.transpiler.parser;

import haxe.Exception;
import haxe.Serializer;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;
using hxnvim.common.DynamicTools;

import hxnvim.common.Json;
import hxnvim.target.Target;
import hxnvim.transpiler.State;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.parser.LiteralTypeParser;
import hxnvim.transpiler.parser.MetadataParser;

private class SymbolParser {
	private final name:String;
	private final doc:String;
	private final meta:Array<SymbolMeta>;
	private final access:Array<SymbolAccess>;
	private final origin:Json;

	public function new(name:String, doc:String, meta:Array<SymbolMeta>, access:Array<SymbolAccess>, origin:Json) {
		this.name = name;
		this.doc = doc;
		this.meta = meta;
		this.access = access;
		this.origin = origin;
	}
}

class FunctionSymbolParser extends SymbolParser {
	function parseParams(params:Array<Json>) {
		return params.map(param -> {
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
	}

	function parseArguments(arguments:Array<Json>, params:Array<Param>) {
		final args = arguments.map(argument -> {
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

		return args;
	}

	function parseOverloads(overloads:Array<Json>, params:Array<Param>) {
		return overloads.map(o -> {
			final overloadType:Dynamic = o.getValue().merge({
				kind: 'function'
			});
			final overloadFile = '${o.pos.file}:${o.pos.min}-${o.pos.max}';
			final overloadJson = Json.fromDynamic(overloadType, overloadFile);

			return new LiteralTypeParser(overloadJson, params).parse();
		});
	}

	function parseReturns(returns:Array<Json>, params:Array<Param>) {
		return switch (returns) {
			case []: "Dynamic";
			case [r]: new LiteralTypeParser(r.select('type'), params).parse();
			case r if (r.length > 6): throw new Exception('Unsupported number of return types for function ${this.origin.getValue()}');
			case rs: 
				final returns = rs.map(r -> new LiteralTypeParser(r.select("type"), params).parse()).padEnd(6, "Void"); 
				Target.toHelperReference('Multireturn<${returns.join(", ")}>');
		}
	}

	public function parse() {
		final params = this.parseParams(this.origin.select('generics').array());
		final args = this.parseArguments(this.origin.select('arguments').array(), params);
		final overloads = this.parseOverloads(this.origin.select('overloads').array(), params);
		final ret = this.parseReturns(this.origin.select('returns').array(), params);

		return {
			name: this.name,
			doc: this.doc,
			meta: this.meta,
			access: this.access,
			params: params,
			args: args,
			ret: ret,
			overloads: overloads
		};
	}
}

class AliasSymbolParser extends SymbolParser {
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

class EnumeratorSymbolParser extends SymbolParser {
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

class TableSymbolParser extends SymbolParser {
	function parseField(name:String, doc:String, meta:Array<SymbolMeta>, access:Array<SymbolAccess>, field:Json) {
		final type = field.select('type');

		return switch (type.select('kind').string()) {
			case 'function':
				final symbol = new FunctionSymbolParser(name, doc, meta, access, type).parse();
				TableField.Method(symbol);

			case 'unknown', 'modulereference', 'typereference', 'builtin', 'union', 'optional', 'array', 'booleanliteral', 'numericliteral', 'stringliteral':
				final symbol = new AliasSymbolParser(name, doc, meta, access, type).parse();
				TableField.Property(symbol);

			case k:
				throw new Exception('Unexpected kind "${k}" received for table "${this.name}" in field "${name}" of type ${type.getValue()}');
		}
	}

	public function parse(handleNestedTable:(fieldName:String, origin:Json) -> Void) {
		final parsedTable = {
			name: this.name,
			doc: this.doc,
			meta: this.meta,
			access: this.access,
			fields: [],
		}

		final fields = this.origin.select('fields').array();

		for (fieldJson in fields) {
			final field = switch (State.consume(t -> t.overrides).get(fieldJson.select('name').string())) {
				case null: fieldJson;
				case fieldOverride:
					final fieldValue = fieldJson.getValue();
					final fieldOverrideValue = fieldOverride.eval(["value" => fieldValue]);
					final file = '${fieldJson.pos.file}:${fieldJson.pos.min}-${fieldJson.pos.max}&${fieldOverride}';
					Json.fromDynamic(fieldValue.merge(fieldOverrideValue), file);
			}

			final fieldName = field.select('name').string();

			if (field.select('type', 'kind').string() == 'table') {
				handleNestedTable(fieldName, field);
				continue;
			}

			final fieldDoc = field.select('documentation').array().map(line -> line.string()).toDoc();

			final metaParser = new MetaParser(field.select('meta'));
			final fieldAccess = metaParser.parseAccess();
			final fieldMeta = metaParser.parseMeta();

			parsedTable.fields.push(this.parseField(fieldName, fieldDoc, fieldMeta, fieldAccess, field));
		}

		return parsedTable;
	}
}
