package transpiler.parser;

using utils.ArrayTools;

import utils.Json;
import transpiler.symbol.Symbol;

class AccessParser {
	private final origin:Json;

	public function new(origin:Json) {
		this.origin = origin;
	}

	public function parse() {
		final access = new Array<ParsedAccess>();

		this.origin.array().map(meta -> meta.string()).iter(meta -> switch (meta) {
			case "static": access.push(ParsedAccess.Static);
			case "private": access.push(ParsedAccess.Private);
			// TODO: info log
			case _:
		});

		return access;
	}
}

class MetaParser {
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
