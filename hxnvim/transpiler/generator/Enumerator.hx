package transpiler.generator;

import haxe.macro.Context;
import haxe.macro.Expr;

using utils.NullTools;

import transpiler.symbol.Symbol;
import transpiler.parser.Parser;
import transpiler.generator.Type;
import transpiler.generator.Meta;

class EnumeratorGenerator {
	public function new() {}

	public function generate(enumerator:Enumerator, ?meta:Array<Metadata>):TypeDefinition {
		meta = meta.or([]).concat(enumerator.meta);

		final name = enumerator.name;

		final underlyingType = new LiteralTypeGenerator().generate(enumerator.type);
		final kind = TDAbstract(underlyingType, [AbEnum], [underlyingType], [underlyingType]);

		final fields = new Array<Field>();

		for (fieldName => fieldValue in enumerator.fields.keyValueIterator()) {
			fields.push({
				name: fieldName,
				kind: FVar(null, macro $v{fieldValue}),
				pos: Context.currentPos()
			});
		}

		return {
			name: name,
			pack: [],
			kind: kind,
			meta: meta.map(m -> new MetaGenerator().generate(m)),
			fields: fields,
			pos: Context.currentPos(),
			isExtern: true
		}
	}
}
