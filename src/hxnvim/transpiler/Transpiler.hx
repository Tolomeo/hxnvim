package hxnvim.transpiler;

import haxe.Exception;

using hxnvim.utils.StringTools;

import hxnvim.Logger;
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

	function transpileChildSymbol(name:String, child:Json) {
		final transpiledChild = State.fork(target -> {
			final spec = target.input.spec.substring(child.pos.min, child.pos.max);
			return target.child(name, spec);
		}, () -> this.transpileSymbol(child));

		this.result.push(transpiledChild);
	}

	function transpileSymbol(symbol:Json) {
		Logger.verbose('Transpiling ${State.consume(target -> target)}');

		final parsed = new Parser(symbol, this.transpileChildSymbol).parse();

		return switch (this.target.output.type) {
			case TargetType.Annotation: new TypeModuleGenerator().generate(parsed);
			case TargetType.Module: new RequireModuleGenerator().generate(parsed);
			case TargetType.Namespace: new NamespaceModuleGenerator().generate(parsed);
			case _: throw new Exception('Error transpiling ${this.target.file}: unexpected target type received <${this.target.output}>');
		}
	}

	public function transpile() {
		this.result.push('package ${this.target.output.pack};');

		State.provide(this.target, () -> {
			final symbol = Json.fromString(this.target.input.spec, this.target.input.file);
			this.result.push(this.transpileSymbol(symbol));
		});

		return this.result.join("\n\n");
	}
}
