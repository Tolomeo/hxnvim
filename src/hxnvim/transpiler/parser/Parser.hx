package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.utils.ArrayTools;
using hxnvim.utils.StringTools;

import hxnvim.utils.Json;
import hxnvim.transpiler.State;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.symbol.Module;
import hxnvim.transpiler.parser.SymbolParser;
import hxnvim.transpiler.parser.MetadataParser;

class Parser {
	private final name:String;
	private final symbol:Json;
	private var result:ParsedModule = null;

	public function new() {
		this.name = State.consume(v -> v.output.name);
		final input = State.consume(v -> v.input);
		this.symbol = Json.parse(input.spec, input.file);
	}

	public function parse():ParsedModule {
		this.result = {
			types: [],
			main: null
		}

		this.result.main = this.parseSymbol(this.name, this.symbol);

		return this.result;
	}

	private function parseSymbol(name: String, symbol:Json) {
		final doc = symbol.select('documentation').array().map(line -> line.string()).toDoc();
		final access = new AccessParser(symbol.select('meta')).parse();
		final metadata = new MetaParser(symbol.select('meta')).parse();
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
