package hxnvim.transpiler.parser;

import haxe.Exception;
import haxe.Rest;
import haxe.Serializer;

using hxnvim.utils.ArrayTools;
using hxnvim.utils.StringTools;

import hxnvim.Config;
import hxnvim.utils.Json;
import hxnvim.transpiler.State;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.symbol.Module;
import hxnvim.transpiler.parser.SymbolParser;
import hxnvim.transpiler.parser.MetadataParser;

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
