package hxnvim.transpiler.symbol;

import hxnvim.transpiler.symbol.Symbol;

typedef ParsedModule = {
	types:Map<String, ParsedSymbol>,
	main:ParsedSymbol
}
