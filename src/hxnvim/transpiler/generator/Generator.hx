package hxnvim.transpiler.generator;

import haxe.macro.Printer;
import haxe.macro.Expr.TypeDefinition;
import haxe.Exception;

using hxnvim.common.NullTools;
using hxnvim.common.StringTools;

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

	function generateType(symbol:Symbol, ?meta:Array<Metadata>) {
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

class NamespaceModuleGenerator extends Generator {
	override function generateTableType(table:Table, ?meta:Array<Metadata>) {
		table.name = State.consume(t -> t.output.qualifiedName.toTypeName());
		return new ClassGenerator().generate(table, meta);
	}

	override function generateAliasType(alias:Alias, ?meta:Array<Metadata>) {
		alias.name = State.consume(t -> t.output.qualifiedName.toTypeName());
		return new AliasGenerator().generate(alias, meta);
	}

	override public function generate(symbol:Symbol) {
		final priv4te = {
			name: 'private'
		};
		final native = {
			name: 'native',
			params: switch (State.consume(target -> target.output.nativeChild)) {
				case []: [State.consume(s -> s.output.native)];
				case childPath: [[State.consume(s -> s.output.native)].concat(childPath).join(".")];
			}
		}
		final typeDefinition = this.generateType(symbol, [native, priv4te]);
		final namespace = '@:native("${typeDefinition.name}") extern final ${State.consume(t -> t.output.name)}: ${typeDefinition.name};';

		return '${this.printer.printTypeDefinition(typeDefinition)}\n\n${namespace}';
	}
}

class TypeModuleGenerator extends Generator {
	override function generateTableType(table:Table, ?meta:Array<Metadata>) {
		meta = [{name: 'structInit'}].concat(meta.or([]));

		return new ClassGenerator().generate(table, meta);
	}
}
