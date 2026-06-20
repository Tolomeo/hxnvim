package hxnvim.transpiler;

import haxe.Exception;

using hxnvim.common.StringTools;

import hxnvim.Logger;
import hxnvim.common.Json;
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

	function transpileChildSymbol(childName:String, child:Json) {
		final transpiledChild = State.fork(target -> {
			final childFile = '${target.input.file}:${child.pos.min},${child.pos.max}';
			final childSpec = child.toString();
			return target.createChild(childName, target.type, childFile, childSpec);
		}, () -> this.transpileSymbol(child));

		this.result.push(transpiledChild);
	}

	function transpileSymbol(symbol:Json) {
		Logger.verbose('Transpiling ${State.consume(target -> target)}');

		final parsed = new Parser(symbol, this.transpileChildSymbol).parse();

		return switch (this.target.type) {
			case TargetType.Annotation: new TypeModuleGenerator().generate(parsed);
			case TargetType.Module: new ModuleGenerator().generate(parsed);
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
