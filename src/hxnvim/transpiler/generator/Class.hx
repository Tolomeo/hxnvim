package hxnvim.transpiler.generator;

import haxe.Exception;
import haxe.macro.Expr;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.Expr.Field;

using hxnvim.common.NullTools;
using hxnvim.common.StringTools;
using hxnvim.common.ArrayTools;
using hxnvim.transpiler.symbol.SymbolTools;

import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.generator.Meta;
import hxnvim.transpiler.generator.Field;

private abstract class ClassGenerator {
	final table:Table;

	public function new(table:Table) {
		this.table = table;
	}

	function generateProperty(property:Variable, opt:Bool) {
		return new PropertyGenerator(property, opt).generate();
	}

	function generateMethod(method:Function, opt:Bool) {
		return new MethodGenerator(method, opt).generate();
	}

	function generateFields(fields:Array<TableField>):Array<Field> {
		return fields.flatMap(field -> {
			return switch (field) {
				case TableField.Method(func, opt): this.generateMethod(func, opt);
				/* case TableField.Method(func, opt):
					final needsFacade = func.type.args.exists(arg -> arg.type.isOneOf("AnyTable", "Table", "TableStructure", "TypeReference"));

					if (needsFacade) {
						final facadedMethod = this.generateFacadedMethod(func, opt);
						[facadedMethod.facade, facadedMethod.method];
					} else {
						final method = this.generateMethod(func, opt);
						[method];
				}*/
				case TableField.Property(prop, opt): [this.generateProperty(prop, opt)];
				case s: throw new Exception('Unexpected ${s} table field received');
			}
		});
	}

	function generateMeta(tableMeta:Array<SymbolMeta>) {
		return tableMeta.map(m -> switch (m) {
			case SymbolMeta.Deprecated:
				new MetaGenerator("deprecated").generate();
			case SymbolMeta.Native(native):
				new MetaGenerator("native", [macro $v{native}]).generate();
			case StructInit:
				new MetaGenerator("structInit").generate();
			case _:
				throw new Exception('Invalid meta for table: ${m}');
		});
	}

	function generateDefinition(name:String, doc:String, meta:Array<MetadataEntry>, fields:Array<Field>):TypeDefinition {
		return {
			name: name,
			doc: doc,
			pack: [],
			kind: TDClass(),
			meta: meta,
			fields: fields,
			pos: null,
			isExtern: true
		};
	}

	public function generate(?meta:Array<SymbolMeta>) {
		meta = meta.or([]).concat(this.table.meta);

		// Not needed? We don't have inheritance anymore
		/* final kind = switch (this.origin.parent) {
				  case None: TDClass();
				  case Some(parsedParent):
			final superClass = switch (new TypeGenerator(parsedParent).make()) {
			  case TPath(typePath): typePath;
			  case _: throw 'Cannot extact type path for parent "${parsedParent}"';
			}
			TDClass(superClass);
		}*/

		return this.generateDefinition(this.table.name, this.table.doc, this.generateMeta(meta), this.generateFields(this.table.fields));
	}
}

class AnnotationClassGenerator extends ClassGenerator {
	override function generateMethod(method:Function, opt:Bool) {
		return new AnnotationMethodGenerator(method, opt).generate();
	}

	override function generateProperty(property:Variable, opt:Bool) {
		return new AnnotationPropertyGenerator(property, opt).generate();
	}

	override function generateDefinition(name:String, doc:String, meta:Array<MetadataEntry>, fields:Array<Field>):TypeDefinition {
		final definition = super.generateDefinition(name, doc, meta, fields);

		definition.isExtern = false;

		return definition;
	}
}

class ModuleClassGenerator extends ClassGenerator {
	override function generateMethod(method:Function, opt:Bool) {
		return new ModuleMethodGenerator(method, opt).generate();
	}
}

// TODO: detect when a function is treated as a method, and automatically add the first self argument
class NamespaceClassGenerator extends ClassGenerator {
	override function generateMethod(method:Function, opt:Bool) {
		return new NamespaceMethodGenerator(method, opt).generate();
	}

	override function generateProperty(property:Variable, opt:Bool) {
		return new NamespacePropertyGenerator(property, opt).generate();
	}
}
