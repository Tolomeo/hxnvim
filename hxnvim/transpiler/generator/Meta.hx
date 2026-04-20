package transpiler.generator;

import haxe.macro.Expr.MetadataEntry;
import transpiler.parser.Parser;

class MetaGenerator {
	public function new() {}

	public function generate(parsedMetadata:ParsedMetadata):MetadataEntry {
		return {name: ':${parsedMetadata.name}', params: parsedMetadata.params?.map(p -> macro $v{p}), pos: (macro null).pos};
	}
}
