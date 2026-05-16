package hxnvim.transpiler;

using hxnvim.utils.StringTools;

import hxnvim.utils.Json;
import hxnvim.transpiler.State;
import hxnvim.transpiler.IO;
import hxnvim.transpiler.parser.Parser;
import hxnvim.transpiler.generator.Generator;

class Transpiler {
	final io:IO;
	final result:Array<String> = [];

	public function new(io:IO) {
		this.io = io;
	}

	function generatePackage() {
		return 'package ${this.io.output.pack.join(".")};';
	}

	function transpileChildSymbol(name:String, symbol:Json) {
		final outputName = name.toTypeName();

		final transpiled = State.fork(state -> {
			/* trace(symbol.pos.file);
				trace(symbol.pos.min, symbol.pos.max);
				trace(state.input.spec.substring(symbol.pos.min, symbol.pos.max)); */
			state.output.name = outputName;
			state.output.native = '${state.output.native}.${name}';
			state.input.spec = state.input.spec.substring(symbol.pos.min, symbol.pos.max);
			return state;
		}, () -> this.transpileSymbol(symbol));

		this.result.push(transpiled);
	}

	function transpileSymbol(symbol:Json) {
		final parsed = new Parser(symbol).parse(this.transpileChildSymbol);

		return switch (this.io.target) {
			case ModuleType.Type: new TypeModuleGenerator().generate(parsed);
			case ModuleType.Module: new RequireModuleGenerator().generate(parsed);
			case ModuleType.Namespace: new NamespaceModuleGenerator().generate(parsed);
		}
	}

	public function transpile() {
		this.result.push(this.generatePackage());

		State.provide({
			input: this.io.input,
			output: this.io.output,
		}, () -> {
			final symbol = Json.parse(this.io.input.spec, this.io.input.file);
			this.result.push(this.transpileSymbol(symbol));
		});

		return this.result.join("\n\n");
	}
}
