package transpiler.generator;

import haxe.macro.Context;
import haxe.macro.Expr.TypeDefinition;

using utils.NullTools;

import transpiler.symbol.Symbol;
import transpiler.parser.Parser;
import transpiler.generator.Type;
import transpiler.generator.Meta;

/* import transpiler.parser.Alias.ParsedAlias;
	import transpiler.parser.Meta.ParsedMetadata;
	import transpiler.generator.Meta;
	import transpiler.generator.Type; */
class AliasGenerator {
	public function new() {}

	public function generate(alias:Alias, ?meta:Array<Metadata>):TypeDefinition {
		meta = meta.or([]);

		final name = alias.name;

		return {
			name: name,
			pack: [],
			kind: TDAlias(new LiteralTypeGenerator().generate(alias.type)),
			meta: meta.map(m -> new MetaGenerator().generate(m)),
			fields: [],
			pos: Context.currentPos(),
			isExtern: true
		}
	}
}
