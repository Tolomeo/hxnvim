package transpiler.generator;

import haxe.macro.Printer;
import haxe.macro.Expr.TypeDefinition;
import haxe.Exception;
import transpiler.State;
import transpiler.symbol.Module;
import transpiler.symbol.Symbol;
import transpiler.parser.Parser;
import transpiler.generator.Alias;
import transpiler.generator.Class;
import transpiler.generator.Enumerator;

typedef Module = Array<TypeDefinition>;

class ModuleGenerator {
	final moduleName:String;
	final moduleNativeName:String;
	final modulePack:Array<String>;

	public function new() {
		final state = State.consume(v -> v);

		this.moduleName = state.output.name;
		this.moduleNativeName = state.output.native;
		this.modulePack = state.output.pack;
	}

	public function make(parsedModule:ParsedModule) {
		final moduleTypes = new Array<TypeDefinition>();

		final metaPrivate:Metadata = {name: 'private'};
		final metaNative:Metadata = {name: 'native', params: [this.moduleNativeName]};

		for (_ => type in parsedModule.types.keyValueIterator()) {
			switch (type) {
				/* case ModuleType.Enumerator(parsedEnumerator):
					result.push(new EnumeratorGenerator(parsedEnumerator).make([metaPrivate])); */
				case ParsedSymbol.ParsedTable(table):
					moduleTypes.push(new ClassGenerator().generate(table));
				case ParsedSymbol.ParsedAlias(alias):
					moduleTypes.push(new AliasGenerator().generate(alias));
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
			case ParsedSymbol.ParsedAlias(alias):
				if (this.moduleName == alias.name) {
					moduleTypes.push(new AliasGenerator().generate(alias, [metaNative]));
				} else {
					final metaMainAlias:Metadata = {name: 'native', params: [alias.name]};
					moduleTypes.push(new AliasGenerator().generate(alias, [metaPrivate, metaNative]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: alias.name}, [metaMainAlias]));
				}
			case ParsedSymbol.ParsedEnumerator(enumerator):
				if (this.moduleName == enumerator.name) {
					moduleTypes.push(new EnumeratorGenerator().generate(enumerator, [metaNative]));
				} else {
					final metaMainEnumerator:Metadata = {name: 'native', params: [enumerator.name]};
					moduleTypes.push(new EnumeratorGenerator().generate(enumerator, [metaPrivate, metaNative]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: enumerator.name}, [metaMainEnumerator]));
				}
			case s:
				throw new Exception('Unimplemented main generator for symbol ${s}');
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
		result.push(this.generatePackage(modulePack));

		final moduleTypes = this.make(parsedModule);

		for (moduleType in moduleTypes) {
			result.push(printer.printTypeDefinition(moduleType));
		}

		return result.join("\n\n");
	}
}
