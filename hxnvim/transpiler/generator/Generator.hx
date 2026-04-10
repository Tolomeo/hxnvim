package transpiler.generator;

// import haxe.macro.Printer;
import haxe.macro.Expr.TypeDefinition;
import transpiler.State;
/* import transpiler.parser.Parser;
import transpiler.parser.Meta.ParsedMetadata;
import transpiler.generator.Enumerator;
import transpiler.generator.Alias;
import transpiler.generator.Class; */

typedef Module = Array<TypeDefinition>;

class Generator {
	// final origin:Parser;

	public function new() {
		// this.origin = origin;
	}

	/* public function make(moduleName:String, moduleNativeName:String) {
		final parsedModule = this.origin.parse();

		final result = new Array<TypeDefinition>();
		final metaPrivate:ParsedMetadata = {name: 'private'};
		final metaNative:ParsedMetadata = {name: 'native', params: [moduleNativeName]};

		for (_ => type in parsedModule.types.keyValueIterator()) {
			switch (type) {
				case ModuleType.Enumerator(parsedEnumerator):
					result.push(new EnumeratorGenerator(parsedEnumerator).make([metaPrivate]));
				case ModuleType.Alias(parsedAlias):
					result.push(new AliasGenerator(parsedAlias).make([metaPrivate]));
				case ModuleType.Class(parsedClass):
					result.push(new ClassGenerator(parsedClass).make([metaPrivate]));
			}
		}

		switch (moduleName == parsedModule.main.name) {
			case true:
				result.push(new ClassGenerator(parsedModule.main).make([metaNative]));
			case false:
				final metaMainAlias:ParsedMetadata = {name: 'native', params: [parsedModule.main.name]};
				result.push(new ClassGenerator(parsedModule.main).make([metaPrivate, metaNative]));
				result.push(new AliasGenerator({name: moduleName, type: parsedModule.main.name}).make([metaMainAlias]));
		}

		return result;
	} */

	function generatePackage(pack:Array<String>) {
		return 'package ${pack.join(".")};';
	}

	public function generate() {
		final state = State.consume(v -> v);

		trace(state.output);
		/* final state = State.consume(stateValue -> stateValue);
		final nativeName = state.input.moduleName;
		final moduleName = state.output.moduleName;
		final modulePack = state.output.pack;

		final printer = new Printer();
		final result = new Array<String>();
		final moduleTypes = this.make(moduleName, nativeName);

		result.push(this.generatePackage(modulePack));

		for (moduleType in moduleTypes) {
			result.push(printer.printTypeDefinition(moduleType));
		}

		return result.join("\n\n"); */
		return "";
	}
}

