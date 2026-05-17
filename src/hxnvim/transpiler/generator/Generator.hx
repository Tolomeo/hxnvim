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
	final printer:Printer;

	public function new() {
		this.printer = new Printer();
	}

	function generateTableType(table:Table, ?meta:Array<Metadata>) {
		return new ClassGenerator().generate(table, meta);
	}

	function generateAliasType(alias:Alias, ?meta:Array<Metadata>) {
		return new AliasGenerator().generate(alias, meta);
	}

	function generateEnumeratorType(enumerator:Enumerator, ?meta:Array<Metadata>) {
		return new EnumeratorGenerator().generate(enumerator, meta);
	}

	function generateType(symbol:ParsedSymbol, ?meta:Array<Metadata>) {
		meta = meta.or([]);

		return switch (symbol) {
			case ParsedSymbol.ParsedTable(table):
				this.generateTableType(table, meta);
			case ParsedSymbol.ParsedAlias(alias):
				this.generateAliasType(alias, meta);
			case ParsedSymbol.ParsedEnumerator(enumerator):
				this.generateEnumeratorType(enumerator, meta);
			case s:
				throw new Exception('Unimplemented main generator for symbol ${s}');
		}
	}
}

class NamespaceModuleGenerator extends Generator {
	public function generate(symbol:ParsedSymbol) {
		final native = {
			name: 'native',
			params: switch (State.consume(target -> target.output.nativeChild)) {
				case []: [State.consume(s -> s.output.native)];
				case childPath: [[State.consume(s -> s.output.native)].concat(childPath).join(".")];
			}
		}
		final typeDefinition = this.generateType(symbol, [native]);

		return this.printer.printTypeDefinition(typeDefinition);
	}
}

class TypeModuleGenerator extends Generator {
	override function generateTableType(table:Table, ?meta:Array<Metadata>) {
		meta = [{name: 'structInit'}].concat(meta.or([]));

		return new ClassGenerator().generate(table, meta);
	}

	public function generate(symbol:ParsedSymbol) {
		// final structInit:Metadata = {name: 'structInit'};
		final typeDefinition = this.generateType(symbol);

		return this.printer.printTypeDefinition(typeDefinition);
	}
}

class RequireModuleGenerator extends Generator {
	public function generate(symbol:ParsedSymbol) {
		final luaRequire:Metadata = {
			name: 'luaRequire',
			params: switch (State.consume(target -> target.output.nativeChild)) {
				case []: [State.consume(s -> s.output.native)];
				case childPath: [State.consume(s -> s.output.native), childPath.join(".")];
			}
		};
		final typeDefinition = this.generateType(symbol, [luaRequire]);

		return this.printer.printTypeDefinition(typeDefinition);
	}
}
