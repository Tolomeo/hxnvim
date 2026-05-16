package hxnvim.transpiler.generator;

import haxe.macro.Printer;
import haxe.macro.Expr.TypeDefinition;
import haxe.Exception;

using hxnvim.utils.NullTools;

import hxnvim.transpiler.State;
import hxnvim.transpiler.symbol.Symbol;
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

	function generatePackage() {
		return 'package ${this.modulePack.join(".")};';
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
}

class NamespaceModuleGenerator extends Generator {
	public function new() {
		super();
	}

	/* public function generateTypes(symbols:Array<ParsedSymbol>) {
		// moduleTypes.push(this.generateType(parsedModule.main, [{name: 'native', params: [this.moduleNativeName]}]));
		return symbols.map(s -> this.generateType(s));
	}*/
	/* public function generate(symbols:Array<ParsedSymbol>) {
		final printer = new Printer();
		final pack = this.generatePackage();
		final types = this.generateTypes(symbols).map(t -> printer.printTypeDefinition(t));

		return [pack].concat(types).join("\n\n");
	}*/
	public function generate(symbol:ParsedSymbol) {
		final printer = new Printer();
		final meta = [{name: 'native', params: [State.consume(s -> s.output.native)]}];
		final typeDefinition = this.generateType(symbol, meta);

		return printer.printTypeDefinition(typeDefinition);
	}
}

class TypeModuleGenerator extends Generator {
	public function new() {
		super();
	}

	/* public function generateTypes(symbols:Array<ParsedSymbol>) {
		// final private_:Metadata = {name: 'private'};
		// final structInit:Metadata = {name: 'structInit'};

		return symbols.map(s -> this.generateType(s));
	}*/
	public function generate(symbol:ParsedSymbol) {
		final printer = new Printer();
		final typeDefinition = this.generateType(symbol);

		return printer.printTypeDefinition(typeDefinition);
	}
}

class RequireModuleGenerator extends Generator {
	public function new() {
		super();
	}

	// public function generateTypes(symbols:Array<ParsedSymbol>) {

	/* final private_:Metadata = {name: 'private'};
		final luaRequire:Metadata = {
			name: 'luaRequire',
			params: [this.moduleNativeName]
	};*/
	/* return symbols.map(s -> this.generateType(s));
	}*/
	public function generate(symbol:ParsedSymbol) {
		final printer = new Printer();
		final typeDefinition = this.generateType(symbol);

		return printer.printTypeDefinition(typeDefinition);
	}
}
