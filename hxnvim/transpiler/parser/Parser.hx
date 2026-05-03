package transpiler.parser;

import haxe.Exception;
import haxe.Rest;
import haxe.Serializer;
import haxe.extern.EitherType;

using utils.ArrayTools;
using utils.StringTools;

import Config;
import utils.Json;
import transpiler.State;
import transpiler.symbol.Symbol;
import transpiler.symbol.Module;
import transpiler.parser.SymbolParser;

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
			case "table":
				final symbol = new TableSymbolParser(name, doc, metadata, access, type).parse(this.result);
				return ParsedSymbol.ParsedTable(symbol);

			case "typereference", "union", "unknown", "function", "builtin", "stringliteral", "numericliteral", "array":
				final symbol = new AliasSymbolParser(name, doc, metadata, access, type).parse();
				return ParsedSymbol.ParsedAlias(symbol);

			case "enumerator":
				final symbol = new EnumeratorSymbolParser(name, doc, metadata, access, type).parse();
				return ParsedSymbol.ParsedEnumerator(symbol);

			case u: throw new Exception('Error parsing ${name}: ${u} not implemented');
		}
	}
}
