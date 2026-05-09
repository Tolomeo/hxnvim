package transpiler;

import transpiler.State;
import transpiler.IO;
import transpiler.parser.Parser;
import transpiler.generator.Generator;

class Transpiler {
	static public function transpile(io:IO) {
		final state = {
			input: io.input,
			output: io.output,
		};

		return State.provide(state, () -> {
			final parsed = new Parser().parse();

			return switch (io.target) {
				case Target.Type: new TypeModuleGenerator().generate(parsed);
				case Target.Module: new RequireModuleGenerator().generate(parsed);
				case Target.Namespace: new NamespaceModuleGenerator().generate(parsed);
			}
		});
	}
}
