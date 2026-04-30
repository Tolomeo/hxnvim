package transpiler;

import transpiler.State;
import transpiler.IO;
// import transpiler.lexer.Lexer;
import transpiler.parser.Parser;
import transpiler.generator.ModuleGenerator;

class Transpiler {
	static public function transpile(io:IO) {
		final state = {
			logs: [],
			input: io.input,
			output: io.output,
			/* lexedGenerics: new Array<String>(),
				parsedGenerics: new Map<String, String>() */
		};

		return State.provide(state, () -> new ModuleGenerator().generate(new Parser().parse()));
	}
}
