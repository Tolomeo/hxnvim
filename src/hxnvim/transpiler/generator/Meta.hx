package hxnvim.transpiler.generator;

import haxe.macro.Expr.MetadataEntry;
import hxnvim.transpiler.symbol.Symbol;

class MetaGenerator {
	final name: String;
	final params: Null<Array<String>>;

	public function new(name: String, ?params: Array<String>) {
		this.name = name;
		this.params = params;
	}

	public function generate():MetadataEntry {
		return {name: ':${this.name}', params: this.params?.map(p -> macro $v{p}), pos: (macro null).pos};
	}
}
