package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.utils.ArrayTools;
using hxnvim.utils.StringTools;
using hxnvim.utils.MapTools;

import hxnvim.utils.Json;
import hxnvim.transpiler.State;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.parser.SymbolParser;
import hxnvim.transpiler.parser.MetadataParser;

class Parser {
	final symbol:Json;
	final handleChild:(name:String, child:Json) -> Void;

	public function new(symbol:Json, handleChild:(name:String, child:Json) -> Void) {
		this.symbol = symbol;
		this.handleChild = handleChild;
	}

	public function parse() {
		final symbol = this.symbol;
		final name = State.consume(v -> v.output.name);
		final doc = symbol.select('documentation').array().map(line -> line.string()).toDoc();
		final access = new AccessParser(symbol.select('meta')).parse();
		final metadata = new MetaParser(symbol.select('meta')).parse();
		final type = symbol.select('type');

		return switch (type.select('kind').string()) {
			case "table":
				final symbol = new TableSymbolParser(name, doc, metadata, access, type).parse(this.handleChild);
				return Symbol.TableSymbol(symbol);

			case "typereference", "union", "unknown", "function", "builtin", "stringliteral", "numericliteral", "array":
				final symbol = new AliasSymbolParser(name, doc, metadata, access, type).parse();
				return Symbol.AliasSymbol(symbol);

			case "enumerator":
				final symbol = new EnumeratorSymbolParser(name, doc, metadata, access, type).parse();
				return Symbol.EnumeratorSymbol(symbol);

			case u: throw new Exception('Error parsing ${name}: ${u} not implemented');
		}
	}
}
