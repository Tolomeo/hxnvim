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

using transpiler.parser.ParserTools;

typedef Module = Array<TypeDefinition>;

class ModuleGenerator {
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

		final metaPrivate:Metadata = {name: 'private'};
		final metaNative:Metadata = {name: 'native', params: [this.moduleNativeName]};

		for (_ => type in parsedModule.types.keyValueIterator()) {
			switch (type) {
				/* case ModuleType.Enumerator(parsedEnumerator):
						result.push(new EnumeratorGenerator(parsedEnumerator).make([metaPrivate]));
					case ModuleType.Alias(parsedAlias):
						result.push(new AliasGenerator(parsedAlias).make([metaPrivate])); */
				case ParsedSymbol.ParsedTable(table):
					moduleTypes.push(new ClassGenerator().generate(table));
				case _:
					throw new Exception('Unsupported type received: ${type}');
			}
		}

		switch (parsedModule.main) {
			case ParsedSymbol.ParsedTable(table):
				if (this.moduleName == table.name) {
					moduleTypes.push(new ClassGenerator().generate(table, [metaNative]));
				} else {
					final metaMainAlias:Metadata = {name: 'native', params: [table.name]};
					moduleTypes.push(new ClassGenerator().generate(table, [metaPrivate, metaNative]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: table.name}, [metaMainAlias]));
				}
			case s:
				throw new Exception('Unimplemented main generator for symbol ${s}');
		}

		/* final main = parsedModule.main.getTable();
			final mainName = main.name;

			switch (this.moduleName == mainName) {
				case true:
					moduleTypes.push(new ClassGenerator().generate(main, [metaNative]));
				case false:
					final metaMainAlias:ParsedMetadata = {name: 'native', params: [mainName]};
					moduleTypes.push(new ClassGenerator().generate(main, [metaPrivate, metaNative]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: mainName}, [metaMainAlias]));
		}*/

		return moduleTypes;
	}

	function generatePackage(pack:Array<String>) {
		return 'package ${pack.join(".")};';
	}

	public function generate(parsedModule:ParsedModule) {
		final state = State.consume(v -> v);

		final printer = new Printer();
		final result = new Array<String>();
		result.push(this.generatePackage(modulePack));

		final moduleTypes = this.make(parsedModule);

		for (moduleType in moduleTypes) {
			result.push(printer.printTypeDefinition(moduleType));
		}

		return result.join("\n\n");
	}
}
