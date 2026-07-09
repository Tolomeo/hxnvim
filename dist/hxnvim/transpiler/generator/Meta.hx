package hxnvim.transpiler.generator;

import haxe.macro.Expr;

class MetaGenerator {
	final name:String;
	final params:Null<Array<Expr>>;

	public function new(name:String, ?params:Array<Expr>) {
		this.name = name;
		this.params = params;
	}

	public function generate():MetadataEntry {
		return {name: ':${this.name}', params: this.params?.map(p -> p), pos: (macro null).pos};
		// return {name: ':${this.name}', params: this.params?.map(p -> macro $v{p}), pos: (macro null).pos};
	}
}
