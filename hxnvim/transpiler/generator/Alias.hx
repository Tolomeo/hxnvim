package transpiler.generator;

import haxe.macro.Context;
import haxe.macro.Expr.TypeDefinition;

using utils.NullTools;

import transpiler.parser.Parser;
import transpiler.generator.Type;
import transpiler.generator.Meta;

/* import transpiler.parser.Alias.ParsedAlias;
	import transpiler.parser.Meta.ParsedMetadata;
	import transpiler.generator.Meta;
	import transpiler.generator.Type; */
class AliasGenerator {
	public function new() {}

	public function generate(alias:Alias, ?meta:Array<ParsedMetadata>):TypeDefinition {
		meta = meta.or([]);

		final name = alias.name;

		return {
			name: name,
			pack: [],
			kind: TDAlias(new TypeGenerator().generate(alias.type)),
			meta: meta.map(m -> new MetaGenerator().generate(m)),
			fields: [],
			pos: Context.currentPos(),
			isExtern: true
		}
	}
}
