package transpiler.generator;

import haxe.macro.Printer;
import haxe.macro.Expr.TypeDefinition;
import haxe.Exception;
import transpiler.State;
import transpiler.parser.Parser;
// import transpiler.parser.Meta.ParsedMetadata;
// import transpiler.generator.Enumerator;
import transpiler.generator.Alias;
import transpiler.generator.Class;

using transpiler.parser.Tools;

typedef Module = Array<TypeDefinition>;

class Generator {
	// final origin:Parser;
	final moduleName:String;
	final moduleNativeName:String;
	final modulePack:Array<String>;

	public function new() {
		final state = State.consume(v -> v);

		this.moduleName = state.output.name;
		this.moduleNativeName = state.output.native;
		this.modulePack = state.output.pack;
	}

	private function symbolName(symbol:ParsedSymbol):String {
		return switch (symbol) {
			case ParsedSymbol.ParsedTable(table): table.name;
			case _: throw new Exception('Unexpected parsed symbol type received: ${symbol}');
		}
	}

	public function make(parsedModule:ParsedModule) {
		final moduleTypes = new Array<TypeDefinition>();

		final metaPrivate:ParsedMetadata = {name: 'private'};
		final metaNative:ParsedMetadata = {name: 'native', params: [this.moduleNativeName]};

		/* for (_ => type in parsedModule.types.keyValueIterator()) {
			switch (type) {
				case ModuleType.Enumerator(parsedEnumerator):
					result.push(new EnumeratorGenerator(parsedEnumerator).make([metaPrivate]));
				case ModuleType.Alias(parsedAlias):
					result.push(new AliasGenerator(parsedAlias).make([metaPrivate]));
				case ModuleType.Class(parsedClass):
					result.push(new ClassGenerator(parsedClass).make([metaPrivate]));
			}
		}*/

		final main = parsedModule.main.getTable();
		final mainName = main.name;

		switch (this.moduleName == mainName) {
			case true:
				moduleTypes.push(new ClassGenerator().generate(main, [metaNative]));
			case false:
				final metaMainAlias:ParsedMetadata = {name: 'native', params: [mainName]};
				moduleTypes.push(new ClassGenerator().generate(main, [metaPrivate, metaNative]));
				moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: mainName}, [metaMainAlias]));
		}

		return moduleTypes;
	}

	function generatePackage(pack:Array<String>) {
		return 'package ${pack.join(".")};';
	}

	public function generate(parsedModule:ParsedModule) {
		final state = State.consume(v -> v);

		final printer = new Printer();
		final result = new Array<String>();
		final moduleTypes = this.make(parsedModule);

		result.push(this.generatePackage(modulePack));

		for (moduleType in moduleTypes) {
			result.push(printer.printTypeDefinition(moduleType));
		}

		return result.join("\n\n");
	}
}
