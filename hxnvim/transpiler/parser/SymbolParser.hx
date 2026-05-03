package transpiler.parser;

import haxe.Exception;

using utils.ArrayTools;

import transpiler.symbol.Symbol;
import transpiler.parser.LiteralTypeParser;
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
