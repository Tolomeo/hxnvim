package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.common.ArrayTools;

import hxnvim.common.Json;
import hxnvim.transpiler.symbol.Symbol;

final metas:Map<String, SymbolMeta> = ["method" => SymbolMeta.Method, "deprecated" => SymbolMeta.Deprecated];

final access:Map<String, SymbolAccess> = [
	"private" => SymbolAccess.Private,
	"protected" => SymbolAccess.Private,
	"package" => SymbolAccess.Private
];

class MetaParser {
	private final origin:Json;

	public function new(origin:Json) {
		this.origin = origin;
	}

	public function parseAccess():Array<SymbolAccess> {
		return this.origin.array()
			.map(m -> m.string())
			.filter(m -> switch (access.get(m)) {
				case null: false;
				case _: true;
			})
			.map(m -> access.get(m));
	}

	public function parseMeta():Array<SymbolMeta> {
		return this.origin.array()
			.map(m -> m.string())
			.filter(m -> switch (metas.get(m)) {
				case null: false;
				case _: true;
			})
			.map(m -> metas.get(m));
	}
}
