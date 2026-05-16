package hxnvim.transpiler.generator;

import haxe.macro.Printer;
import haxe.macro.Expr.TypeDefinition;
import haxe.Exception;

using hxnvim.utils.NullTools;

import hxnvim.transpiler.State;
import hxnvim.transpiler.symbol.Module;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.parser.Parser;
import hxnvim.transpiler.generator.Alias;
import hxnvim.transpiler.generator.Class;
import hxnvim.transpiler.generator.Enumerator;

typedef Module = Array<TypeDefinition>;

private class Generator {
	final moduleName:String;
	final moduleNativeName:String;
	final modulePack:Array<String>;

	public function new() {
		final state = State.consume(v -> v);

		this.moduleName = state.output.name;
		this.moduleNativeName = state.output.native;
		this.modulePack = state.output.pack;
	}

	function generatePackage(pack:Array<String>) {
		return 'package ${pack.join(".")};';
	}
}

class NamespaceModuleGenerator extends Generator {
	public function new() {
		super();
	}

	function generateType(symbol:ParsedSymbol, ?meta:Array<Metadata>) {
		meta = meta.or([]);

		return switch (symbol) {
			case ParsedSymbol.ParsedTable(table):
				new ClassGenerator().generate(table, meta);
			case ParsedSymbol.ParsedAlias(alias):
				new AliasGenerator().generate(alias, meta);
			case ParsedSymbol.ParsedEnumerator(enumerator):
				new EnumeratorGenerator().generate(enumerator, meta);
			case s:
				throw new Exception('Unimplemented main generator for symbol ${s}');
		}
	}

	public function generateTypes(parsedModule:ParsedModule) {
		final moduleTypes = new Array<TypeDefinition>();

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

		moduleTypes.push(this.generateType(parsedModule.main, [{name: 'native', params: [this.moduleNativeName]}]));

		return moduleTypes;
	}

	public function generate(parsedModule:ParsedModule) {
		final printer = new Printer();
		final result = new Array<String>();
		result.push(this.generatePackage(modulePack));

		final moduleTypes = this.generateTypes(parsedModule);

		for (moduleType in moduleTypes) {
			result.push(printer.printTypeDefinition(moduleType));
		}

		return result.join("\n\n");
	}
}

class TypeModuleGenerator extends Generator {
	public function new() {
		super();
	}

	public function generateTypes(parsedModule:ParsedModule) {
		final moduleTypes = new Array<TypeDefinition>();

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

		final private_:Metadata = {name: 'private'};
		final structInit:Metadata = {name: 'structInit'};

		switch (parsedModule.main) {
			case ParsedSymbol.ParsedTable(table):
				if (this.moduleName == table.name) {
					moduleTypes.push(new ClassGenerator().generate(table, [structInit]));
				} else {
					final metaMainAlias:Metadata = {name: 'native', params: [table.name]};
					moduleTypes.push(new ClassGenerator().generate(table, [private_, structInit]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: table.name}, [metaMainAlias]));
				}
			case ParsedSymbol.ParsedAlias(alias):
				if (this.moduleName == alias.name) {
					moduleTypes.push(new AliasGenerator().generate(alias));
				} else {
					final metaMainAlias:Metadata = {name: 'native', params: [alias.name]};
					moduleTypes.push(new AliasGenerator().generate(alias, [private_]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: alias.name}, [metaMainAlias]));
				}
			case ParsedSymbol.ParsedEnumerator(enumerator):
				if (this.moduleName == enumerator.name) {
					moduleTypes.push(new EnumeratorGenerator().generate(enumerator));
				} else {
					final metaMainEnumerator:Metadata = {name: 'native', params: [enumerator.name]};
					moduleTypes.push(new EnumeratorGenerator().generate(enumerator, [private_]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: enumerator.name}, [metaMainEnumerator]));
				}
			case s:
				throw new Exception('Unimplemented main generator for symbol ${s}');
		}

		return moduleTypes;
	}

	public function generate(parsedModule:ParsedModule) {
		final printer = new Printer();
		final result = new Array<String>();
		result.push(this.generatePackage(modulePack));

		final moduleTypes = this.generateTypes(parsedModule);

		for (moduleType in moduleTypes) {
			result.push(printer.printTypeDefinition(moduleType));
		}

		return result.join("\n\n");
	}
}

class RequireModuleGenerator extends Generator {
	public function new() {
		super();
	}

	public function generateTypes(parsedModule:ParsedModule) {
		final moduleTypes = new Array<TypeDefinition>();

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

		final private_:Metadata = {name: 'private'};
		final luaRequire:Metadata = {
			name: 'luaRequire',
			params: [this.moduleNativeName]
		};

		switch (parsedModule.main) {
			case ParsedSymbol.ParsedTable(table):
				if (this.moduleName == table.name) {
					moduleTypes.push(new ClassGenerator().generate(table, [luaRequire]));
				} else {
					final metaMainAlias:Metadata = {name: 'native', params: [table.name]};
					moduleTypes.push(new ClassGenerator().generate(table, [private_, luaRequire]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: table.name}, [metaMainAlias]));
				}
			case ParsedSymbol.ParsedAlias(alias):
				if (this.moduleName == alias.name) {
					moduleTypes.push(new AliasGenerator().generate(alias, [luaRequire]));
				} else {
					final metaMainAlias:Metadata = {name: 'native', params: [alias.name]};
					moduleTypes.push(new AliasGenerator().generate(alias, [private_, luaRequire]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: alias.name}, [metaMainAlias]));
				}
			case ParsedSymbol.ParsedEnumerator(enumerator):
				if (this.moduleName == enumerator.name) {
					moduleTypes.push(new EnumeratorGenerator().generate(enumerator, [luaRequire]));
				} else {
					final metaMainEnumerator:Metadata = {name: 'native', params: [enumerator.name]};
					moduleTypes.push(new EnumeratorGenerator().generate(enumerator, [private_, luaRequire]));
					moduleTypes.push(new AliasGenerator().generate({name: moduleName, type: enumerator.name}, [metaMainEnumerator]));
				}
			case s:
				throw new Exception('Unimplemented main generator for symbol ${s}');
		}

		return moduleTypes;
	}

	public function generate(parsedModule:ParsedModule) {
		final printer = new Printer();
		final result = new Array<String>();
		result.push(this.generatePackage(modulePack));

		final moduleTypes = this.generateTypes(parsedModule);

		for (moduleType in moduleTypes) {
			result.push(printer.printTypeDefinition(moduleType));
		}

		return result.join("\n\n");
	}
}
