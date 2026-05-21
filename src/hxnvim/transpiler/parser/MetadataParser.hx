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
	} */

	private final origin:Json;

	public function new(origin:Json) {
		this.origin = origin;
	}

	public function parse() {
		final access = new Array<SymbolAccess>();

		this.origin.array().map(meta -> meta.string()).iter(meta -> switch (meta) {
			case "static": access.push(SymbolAccess.Static);
			case "private": access.push(SymbolAccess.Private);
			// TODO: info log
			case _:
		});

		return access;
	}
}

class MetaParser {
	public static function create(name:String, ?params:Array<String>) {
		return switch (name) {
			case 'native', 'private': {name: name, params: params};
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
}
