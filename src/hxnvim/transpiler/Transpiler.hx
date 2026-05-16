package hxnvim.transpiler;

import hxnvim.transpiler.State;
import hxnvim.transpiler.IO;
import hxnvim.transpiler.parser.Parser;
import hxnvim.transpiler.generator.Generator;

class Transpiler {
	static public function transpile(io:IO) {
		final state = {
			input: io.input,
			output: io.output,
		};

		return State.provide(state, () -> {
			final parsed = new Parser().parse();

			return switch (io.target) {
				case ModuleType.Type: new TypeModuleGenerator().generate(parsed);
				case ModuleType.Module: new RequireModuleGenerator().generate(parsed);
				case ModuleType.Namespace: new NamespaceModuleGenerator().generate(parsed);
			}
		});
	}
}
