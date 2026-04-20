package transpiler.parser;

import haxe.Exception;
import transpiler.parser.Parser.ParsedSymbol;

class Tools {
	static public function getTable(symbol:ParsedSymbol) {
		return switch (symbol) {
			case ParsedSymbol.ParsedTable(table): table;
			case _: throw new Exception('Error extracting table symbol type from ${symbol}');
		}
	}

	static public function symbolName(symbol:ParsedSymbol):String {
		return switch (symbol) {
			case ParsedSymbol.ParsedTable(table): table.name;
			case _: throw new Exception('Unexpected parsed symbol type received: ${symbol}');
		}
	}
}
