package hxnvim.transpiler.generator;

import haxe.macro.Printer;
import haxe.macro.Expr.TypeDefinition;
import haxe.Exception;

using hxnvim.common.NullTools;

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

	function generateTableType(table:Table, ?meta:Array<SymbolMeta>) {
		return new InstanceClassGenerator(table).generate(meta);
	}

	function generateAliasType(alias:Alias, ?meta:Array<SymbolMeta>) {
		return new AliasGenerator().generate(alias, meta);
	}

	function generateEnumeratorType(enumerator:Enumerator, ?meta:Array<SymbolMeta>) {
		return new EnumeratorGenerator().generate(enumerator, meta);
	}

	function generateType(symbol:Symbol, ?meta:Array<SymbolMeta>) {
		meta = meta.or([]);

		return switch (symbol) {
			case Symbol.TableSymbol(table):
				this.generateTableType(table, meta);
			case Symbol.AliasSymbol(alias):
				this.generateAliasType(alias, meta);
			case Symbol.EnumeratorSymbol(enumerator):
				this.generateEnumeratorType(enumerator, meta);
			case s:
				throw new Exception('Unimplemented main generator for symbol ${s}');
		}
	}

	public function generate(symbol:Symbol) {
		return this.printer.printTypeDefinition(this.generateType(symbol));
	}
}

class NamespaceModuleGenerator extends Generator {
	override function generateTableType(table:Table, ?meta:Array<SymbolMeta>) {
		return new SingletonClassGenerator(table).generate(meta);
	}

	override function generateType(symbol:Symbol, ?meta:Array<SymbolMeta>) {
		final native = switch (State.consume(target -> target.output.nativeChild)) {
			case []: State.consume(s -> s.output.native);
			case childPath: [State.consume(s -> s.output.native)].concat(childPath).join(".");
		}

		meta = [SymbolMeta.Native(native)].concat(meta.or([]));

		return super.generateType(symbol, meta);
	}
}

class TypeModuleGenerator extends Generator {
	override function generateTableType(table:Table, ?meta:Array<SymbolMeta>) {
		meta = [SymbolMeta.StructInit].concat(meta.or([]));

		return super.generateTableType(table, meta);
	}
}

class ModuleGenerator extends Generator {
	/* override public function generate(symbol:Symbol) {
		final luaRequire:Metadata = {
		  name: 'luaRequire',
		  params: switch (State.consume(target -> target.output.nativeChild)) {
			case []: [State.consume(s -> s.output.native)];
			case childPath: [State.consume(s -> s.output.native), childPath.join(".")];
		  }
		};
		final typeDefinition = this.generateType(symbol, [luaRequire]);

		return this.printer.printTypeDefinition(typeDefinition);
	}*/
}
