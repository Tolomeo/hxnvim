package hxnvim.transpiler.generator;

import haxe.Exception;
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.Expr.Field;

using hxnvim.common.NullTools;
using hxnvim.common.StringTools;
using hxnvim.common.ArrayTools;
using hxnvim.transpiler.symbol.SymbolTools;

import hxnvim.target.Target;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.generator.Meta;
import hxnvim.transpiler.generator.Type;

class PropertyGenerator {
	final property:Variable;
	final opt:Bool;

	public function new(property:Variable, opt:Bool) {
		this.property = property;
		this.opt = opt;
	}

	function generateDefinition(name:String, doc:String, meta:Array<MetadataEntry>, access:Array<Access>, kind:FieldType) {
		return {
			meta: meta,
			access: access,
			name: name,
			doc: doc,
			kind: kind,
			pos: Context.currentPos()
		};
	}

	function generateAccess(propertyAccess:Array<SymbolAccess>) {
		return propertyAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case symbolAccess: throw 'Unexpected method access for property ${symbolAccess}';
		});
	}

	function generateMeta(propertyMeta:Array<SymbolMeta>) {
		return propertyMeta.map(m -> switch (m) {
			case SymbolMeta.Deprecated:
				new MetaGenerator("deprecated").generate();
			case SymbolMeta.Native(native):
				new MetaGenerator("native", [macro $v{native}]).generate();
			case SymbolMeta.Optional:
				new MetaGenerator("optional").generate();
			case _:
				throw new Exception('Invalid meta for property: ${m}');
		});
	}

	public function generate() {
		final name = this.property.name.toFieldName();

		final doc = this.property.doc;

		final propertyMeta = this.property.meta.copy();
		if (name != this.property.name) {
			propertyMeta.unshift(SymbolMeta.Native(this.property.name));
		}
		if (this.opt) {
			propertyMeta.unshift(SymbolMeta.Optional);
		}

		final meta = this.generateMeta(propertyMeta);

		final access = this.generateAccess(this.property.access);

		final kind = FieldType.FVar(new LiteralTypeGenerator().generate(this.property.type));

		return this.generateDefinition(name, doc, meta, access, kind);
	}
}

class MethodGenerator {
	final method:Function;
	final opt:Bool;

	public function new(method:Function, opt:Bool) {
		this.method = method;
		this.opt = opt;
	}

	function generateAccess(methodAccess:Array<SymbolAccess>) {
		return methodAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case SymbolAccess.Overload: AOverload;
			case symbolAccess: throw 'Unexpected method access ${symbolAccess}';
		});
	}

	function generateMeta(methodMeta:Array<SymbolMeta>, overloads:Array<LiteralType>) {
		final methodMetas = new Array();

		methodMeta.iter(m -> switch (m) {
			case SymbolMeta.Deprecated:
				methodMetas.push(new MetaGenerator("deprecated").generate());
			case SymbolMeta.Native(native):
				methodMetas.push(new MetaGenerator("native", [macro $v{native}]).generate());
			case SymbolMeta.Optional:
				methodMetas.push(new MetaGenerator("optional").generate());
			case SymbolMeta.Method: // it is left to overrides to decide what to do with this
			case _:
				throw new Exception('Invalid meta for method: ${m}');
		});

		overloads.iter(o -> {
			final overloadType = switch (o) {
				case LiteralType.Overload(_, _): macro $i{new LiteralTypeGenerator().generateType(o)};
				case _: throw new Exception('Error generating method overload: unexpected ${o} type received');
			}
			methodMetas.push(new MetaGenerator("overload", [overloadType]).generate());
		});

		return methodMetas;
	}

	function generateFunctionKind(params:Array<Param>, args:Array<Arg>, ret:LiteralType, ?expr:Expr) {
		final params = params.map(p -> ({
			name: p.name,
			constraints: p.constraints.map(c -> new LiteralTypeGenerator().generate(c)),
		} : TypeParamDecl));
		final args = args.map(a -> ({
			name: a.name,
			type: new LiteralTypeGenerator().generate(a.type),
			opt: a.opt,
		} : FunctionArg));
		final ret = new LiteralTypeGenerator().generate(ret);

		return FieldType.FFun({
			params: params,
			args: args,
			ret: ret,
			expr: expr,
		});
	}

	function generateDefinition(name:String, doc:String, meta:Array<MetadataEntry>, access:Array<Access>, kind:FieldType) {
		return {
			meta: meta,
			access: access,
			name: name,
			doc: doc,
			kind: kind,
			pos: Context.currentPos()
		};
	}

	public var facaded(get, never):Bool;

	function get_facaded() {
		return this.method.type.ret.is("Multireturn")
			|| this.method.type.args.exists(arg -> arg.type.isOneOf("AnyTable", "Table", "TableStructure", "TypeReference"));
	}

	function generateFacade(field:Field) {
		final facadeName = field.name;
		field.name = '__${field.name}';

		final facadeDoc = field.doc;
		field.doc = "";

		final facadeMeta = field.meta.filter(m -> switch (m) {
			case {name: ":native"}: false;
			case {name: ":overload"}: false;
			case _: true;
		});
		field.meta = field.meta.filter(m -> switch (m) {
			case {name: ":deprecated"}: false;
			case _: true;
		});
		if (!field.meta.exists(m -> switch (m) {
			case {name: ':native'}: true;
			case _: false;
		})) {
			field.meta.unshift(new MetaGenerator("native", [macro $v{method.name}]).generate());
		}

		final facadeAccess = [Access.AInline].concat(field.access.filter(a -> switch (a) {
			case AExtern: false;
			case _: true;
		}));
		field.access = [Access.APrivate].concat(field.access.filter(a -> switch (a) {
			case Access.APublic: false;
			case Access.APrivate: false;
			case _: true;
		}));

		final returnTypes = switch (this.method.type.ret) {
			case LiteralType.Multireturn(rs):
				rs.map(r -> switch (r) {
					case LiteralType.Void: Target.toHelperReference("Nothing");
					case LiteralType.Nil: Target.toHelperReference("Nothing");
					case _: new LiteralTypeGenerator().generateType(r);
				});
			case type: [new LiteralTypeGenerator().generateType(type)];
		};
		final returnType = switch (returnTypes) {
			case [r]: r;
			case types: Target.toHelperReference('Multireturn.Return${types.length}<${types.join(", ")}>');
		}
		final pureArgs = this.method.type.args.fold((arg:Arg, pures:Array<String>) -> {
			if (arg.type.isOneOf("AnyTable", "Table", "TableStructure", "TypeReference")) {
				pures.push('${arg.name} = ${Target.toHelperReference("Arg")}.pure(${arg.name})');
			}
			return pures;
		}, []);
		final callArgs = this.method.type.args.map(a -> switch (a.type) {
			case LiteralType.Rest(_): "..." + a.name;
			case _: a.name;
		});
		final call = '${field.name}(${callArgs.join(", ")})';
		final callResultAssignment = 'final result = ${call}';
		final returnStatement = switch (returnTypes) {
			case [r]: 'return result';
			case returns:
				final returnArgs = returns.mapi((i, _) -> 'result._${i}');
				'return new ${returnType}(${returnArgs.join(", ")})';
		}
		final expr = macro $b{
			pureArgs.map(arg -> macro $i{arg}).concat([macro $i{callResultAssignment}, macro $i{returnStatement}])
		}

		final facade = this.generateDefinition(facadeName, facadeDoc, facadeMeta, facadeAccess,
			this.generateFunctionKind(this.method.type.params, this.method.type.args, LiteralType.Override(returnType), expr));

		return [field, facade];
	}

	public function generate():Array<Field> {
		final name = this.method.name.toFieldName();
		final doc = this.method.doc;
		final methodMeta = this.method.meta.copy();
		if (name != this.method.name) {
			methodMeta.unshift(SymbolMeta.Native(this.method.name));
		}
		if (this.opt) {
			methodMeta.unshift(SymbolMeta.Optional);
		}
		final meta = this.generateMeta(methodMeta, this.method.overloads);
		final access = this.generateAccess(this.method.access);

		final field = this.generateDefinition(name, doc, meta, access,
			this.generateFunctionKind(this.method.type.params, this.method.type.args, this.method.type.ret));

		if (!this.facaded) {
			return [field];
		}

		return this.generateFacade(field);
	}
}

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
			pos: Context.currentPos(),
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

class DataPropertyGenerator extends PropertyGenerator {
	override function generateAccess(propertyAccess:Array<SymbolAccess>) {
		final dataPropertyAccess = super.generateAccess(propertyAccess);

		if (dataPropertyAccess.exists(access -> switch (access) {
			case Access.APrivate: true;
			case _: false;
		})) {
			return [Access.AExtern].concat(dataPropertyAccess);
		}

		return [Access.AExtern, Access.APublic].concat(dataPropertyAccess);
	}
}

class DataMethodGenerator extends MethodGenerator {
	override function generateAccess(methodAccess:Array<SymbolAccess>) {
		final dataMethodAccess = super.generateAccess(methodAccess);

		if (dataMethodAccess.exists(access -> switch (access) {
			case Access.APrivate: true;
			case _: false;
		})) {
			return [Access.AExtern].concat(dataMethodAccess);
		}

		return [Access.AExtern, Access.APublic].concat(dataMethodAccess);
	}

	override function generateMeta(methodMeta:Array<SymbolMeta>, overloads:Array<LiteralType>) {
		final dataClassMethodMeta = new Array<MetadataEntry>();

		if (!methodMeta.contains(SymbolMeta.Method)) {
			dataClassMethodMeta.push(new MetaGenerator("luaDotMethod").generate());
		}

		return dataClassMethodMeta.concat(super.generateMeta(methodMeta, overloads));
	}
}

class DataClassGenerator extends ClassGenerator {
	override function generateMethod(method:Function, opt:Bool) {
		return new DataMethodGenerator(method, opt).generate();
	}

	override function generateProperty(property:Variable, opt:Bool) {
		return new DataPropertyGenerator(property, opt).generate();
	}

	override function generateDefinition(name:String, doc:String, meta:Array<MetadataEntry>, fields:Array<Field>):TypeDefinition {
		final definition = super.generateDefinition(name, doc, meta, fields);

		definition.isExtern = false;

		return definition;
	}
}

class InstanceMethodGenerator extends MethodGenerator {
	override function generateMeta(methodMeta:Array<SymbolMeta>, overloads:Array<LiteralType>) {
		final instanceClassMethodMeta = new Array<MetadataEntry>();

		if (!methodMeta.contains(SymbolMeta.Method)) {
			instanceClassMethodMeta.push(new MetaGenerator("luaDotMethod").generate());
		}

		return instanceClassMethodMeta.concat(super.generateMeta(methodMeta, overloads));
	}
}

class InstanceClassGenerator extends ClassGenerator {
	override function generateMethod(method:Function, opt:Bool) {
		return new InstanceMethodGenerator(method, opt).generate();
	}
}

class SingletonPropertyGenerator extends PropertyGenerator {
	override function generateAccess(propertyAccess:Array<SymbolAccess>) {
		return [AStatic].concat(super.generateAccess(propertyAccess));
	}
}

class SingletonMethodGenerator extends MethodGenerator {
	override function generateAccess(methodAccess:Array<SymbolAccess>) {
		return [AStatic].concat(super.generateAccess(methodAccess));
	}
}

// TODO: detect when a function is treated as a method, and automatically add the first self argument
class SingletonClassGenerator extends ClassGenerator {
	override function generateMethod(method:Function, opt:Bool) {
		return new SingletonMethodGenerator(method, opt).generate();
	}

	override function generateProperty(property:Variable, opt:Bool) {
		return new SingletonPropertyGenerator(property, opt).generate();
	}
}
