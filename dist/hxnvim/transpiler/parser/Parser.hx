package hxnvim.transpiler.parser;

import hxnvim.target.Target.TargetType;
import haxe.Exception;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;
using hxnvim.common.MapTools;
using hxnvim.common.NullTools;

import hxnvim.common.Json;
import hxnvim.transpiler.State;
import hxnvim.transpiler.Transpiler;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.parser.Symbol;
import hxnvim.transpiler.parser.Metadata;

abstract class Parser {
	final symbol:Json;
	final transpileChild:TranspileChild;

	public function new(symbol:Json, handleChild:TranspileChild) {
		this.symbol = symbol;
		this.transpileChild = handleChild;
	}

	public function parse() {
		final symbol = this.symbol;
		final name = State.consume(v -> v.output.name);
		final doc = symbol.select('documentation').array().map(line -> line.string()).toDoc();

		final metaParser = new MetaParser(symbol.select('meta'));
		final access = metaParser.parseAccess();
		final meta = metaParser.parseMeta();

		final type = symbol.select('type');

		return switch (type.select('kind').string()) {
			case "table":
				final symbol = new TableSymbolParser(name, doc, meta, access, type, this.transpileChild).parse();
				return Symbol.TableSymbol(symbol);

			case "typereference", "union", "unknown", "function", "builtin", "stringliteral", "numericliteral", "array":
				final symbol = new AliasSymbolParser(name, doc, meta, access, type).parse();
				return Symbol.AliasSymbol(symbol);

			case "enumerator":
				final symbol = new EnumeratorSymbolParser(name, doc, meta, access, type).parse();
				return Symbol.EnumeratorSymbol(symbol);

			case u: throw new Exception('Error parsing ${name}: ${u} not implemented');
		}
	}
}

class NamespaceModuleParser extends Parser {
	override public function new(symbol:Json, transpileChild:TranspileChild) {
		super(symbol, (childName:String, child:Json, ?childType:TargetType) -> transpileChild(childName, child, childType.or(TargetType.Module)));
	}
}

class ModuleParser extends Parser {}
class AnnotationModuleParser extends Parser {}
