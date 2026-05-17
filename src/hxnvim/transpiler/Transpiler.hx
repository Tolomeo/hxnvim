package hxnvim.transpiler;

import haxe.Exception;

using hxnvim.utils.StringTools;

import hxnvim.utils.Json;
import hxnvim.transpiler.State;
import hxnvim.target.Target;
import hxnvim.transpiler.parser.Parser;
import hxnvim.transpiler.generator.Generator;

class Transpiler {
	final target:Target;
	final result:Array<String> = [];

	public function new(target:Target) {
		this.target = target;
	}

	function transpileChildSymbol(name:String, symbol:Json) {
		final transpiledChild = State.fork(target -> {
			final spec = target.input.spec.substring(symbol.pos.min, symbol.pos.max);
			return target.child(name, spec);
		}, () -> this.transpileSymbol(symbol));

		this.result.push(transpiledChild);
	}

	function transpileSymbol(symbol:Json) {
		final parsed = new Parser(symbol, this.transpileChildSymbol).parse();

		return switch (this.target.output.type) {
			case TargetType.Annotation: new TypeModuleGenerator().generate(parsed);
			case TargetType.Module: new RequireModuleGenerator().generate(parsed);
			case TargetType.Namespace: new NamespaceModuleGenerator().generate(parsed);
			case _: throw new Exception('Unexpected target type received "${this.target.output}"');
		}
	}

	public function transpile() {
		this.result.push('package ${this.target.output.pack.join(".")};');

		State.provide(this.target, () -> {
			final symbol = Json.parse(this.target.input.spec, this.target.input.file);
			this.result.push(this.transpileSymbol(symbol));
		});

		return this.result.join("\n\n");
	}
}
