package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;
using hxnvim.common.MapTools;

import hxnvim.common.Json;
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

		final metaParser = new MetaParser(symbol.select('meta'));
		final access = metaParser.parseAccess();
		final meta = metaParser.parseMeta();

		final type = symbol.select('type');

		return switch (type.select('kind').string()) {
			case "table":
				final symbol = new TableSymbolParser(name, doc, meta, access, type).parse(this.handleChild);
				return Symbol.TableSymbol(symbol);

			case "typereference", "union", "unknown", "function", "builtin", "stringliteral", "numericliteral", "array":
				final symbol = new AliasSymbolParser(name, doc, meta, access, type).parse();
				return Symbol.AliasSymbol(symbol);

			case "enumerator":
				final symbol = new EnumeratorSymbolParser(name, doc, meta, access, type).parse();
				return Symbol.EnumeratorSymbol(symbol);

			case u: throw new Exception('Error parsing ${name}: ${u} not implemented');
		}
	}
}
