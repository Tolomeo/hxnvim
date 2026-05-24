package hxnvim.transpiler.generator;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.Exception;

using hxnvim.common.NullTools;

import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.generator.Type;
import hxnvim.transpiler.generator.Meta;

class EnumeratorGenerator {
	public function new() {}

	function generateMeta(enumeratorMeta:Array<SymbolMeta>) {
		return enumeratorMeta.map(m -> switch (m) {
			case SymbolMeta.Deprecated:
				new MetaGenerator().generate({name: "deprecated"});
			case _:
				throw new Exception('Invalid meta for enumerator: ${m}');
		});
	}

	public function generate(enumerator:Enumerator, ?meta:Array<SymbolMeta>):TypeDefinition {
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
			meta: this.generateMeta(meta),
			fields: fields,
			pos: Context.currentPos(),
			isExtern: true
		}
	}
}
