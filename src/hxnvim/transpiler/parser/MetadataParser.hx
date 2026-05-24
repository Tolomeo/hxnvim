package hxnvim.transpiler.parser;

import haxe.Exception;

using hxnvim.common.ArrayTools;

import hxnvim.common.Json;
import hxnvim.transpiler.symbol.Symbol;

class AccessParser {
	/* public static function create(name:String, ?params:Array<String>) {
		return switch (name) {
			case 'native', 'private': {name: name, params: params};
			case n: throw new Exception('Error creating meta of name "${n}": unrecognised');
		}
	}*/
	private final origin:Json;

	public function new(origin:Json) {
		this.origin = origin;
	}

	public function parse() {
		final access = new Array<SymbolAccess>();

		this.origin.array().map(meta -> meta.string()).iter(meta -> switch (meta) {
			// case "static": access.push(SymbolAccess.Static);
			case "private": access.push(SymbolAccess.Private);
			case "protected": access.push(SymbolAccess.Private);
			case "package": access.push(SymbolAccess.Private);
			// TODO: info log
			case _:
		});

		return access;
	}
}

final metas:Map<String, SymbolMeta> = ["method" => SymbolMeta.Method, "deprecated" => SymbolMeta.Deprecated];

final access:Map<String, SymbolAccess> = [
	"private" => SymbolAccess.Private,
	"protected" => SymbolAccess.Private,
	"package" => SymbolAccess.Private
];

class MetaParser {
	public static function create(name:String, ?params:Array<String>) {
		return switch (name) {
			case 'native', 'private', 'luaDotMethod': {name: name, params: params};
			case n: throw new Exception('Error creating meta of name "${n}": unrecognised');
		}
	}

	private final origin:Json;

	public function new(origin:Json) {
		this.origin = origin;
	}

	public function parse() {
		final meta = new Array<Metadata>();

		this.origin.array().map(m -> m.string()).iter(m -> switch (m) {
			case "deprecated": meta.push({name: "deprecated"});
			// TODO: info log
			case _:
		});

		return meta;
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
