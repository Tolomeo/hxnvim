package hxnvim.transpiler;

import haxe.Exception;

using hxnvim.common.StringTools;
using hxnvim.common.NullTools;

import hxnvim.Logger;
import hxnvim.common.Json;
import hxnvim.transpiler.State;
import hxnvim.target.Target;
import hxnvim.transpiler.parser.Parser;
import hxnvim.transpiler.generator.Generator;

typedef TranspileChild = (name:String, child:Json, ?targetType:TargetType) -> Void

class Transpiler {
	final target:Target;
	final result:Array<String> = [];

	public function new(target:Target) {
		this.target = target;
	}

	function transpileChildSymbol(childName:String, child:Json, ?childType:TargetType) {
		final transpiledChild = State.fork(target -> {
			childType = childType.or(target.type);
			final childFile = '${target.input.file}:${child.pos.min},${child.pos.max}';
			final childSpec = child.toString();
			return target.createChild(childName, childType, childFile, childSpec);
		}, () -> this.transpileSymbol(child));

		this.result.push(transpiledChild);
	}

	function transpileSymbol(symbol:Json) {
		final currentTarget = State.consume(t -> t);

		Logger.verbose('Transpiling ${currentTarget}');

		final parsed = switch (currentTarget.type) {
			case TargetType.Namespace: new NamespaceModuleParser(symbol, this.transpileChildSymbol).parse();
			case _: new Parser(symbol, this.transpileChildSymbol).parse();
		}

		return switch (currentTarget.type) {
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
