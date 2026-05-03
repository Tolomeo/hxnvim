package transpiler.symbol;

import transpiler.symbol.Symbol;

typedef ParsedModule = {
	types:Map<String, ParsedSymbol>,
	main:ParsedSymbol
}
