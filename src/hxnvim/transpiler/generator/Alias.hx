package hxnvim.transpiler.generator;

import haxe.macro.Context;
import haxe.macro.Expr.TypeDefinition;
import haxe.Exception;

using hxnvim.common.NullTools;

import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.parser.Parser;
import hxnvim.transpiler.generator.Type;
import hxnvim.transpiler.generator.Meta;

class AliasGenerator {
	public function new() {}

	function generateMeta(tableMeta:Array<SymbolMeta>) {
		return tableMeta.map(m -> switch (m) {
			case SymbolMeta.Deprecated:
				new MetaGenerator("deprecated").generate();
			case _:
				throw new Exception('Invalid meta for table: ${m}');
		});
	}

	public function generate(alias:Alias, ?meta:Array<SymbolMeta>):TypeDefinition {
		meta = meta.or([]);

		final name = alias.name;

		return {
			name: name,
			pack: [],
			kind: TDAlias(new LiteralTypeGenerator().generate(alias.type)),
			meta: this.generateMeta(meta),
			fields: [],
			pos: Context.currentPos(),
			isExtern: true
		}
	}
}
