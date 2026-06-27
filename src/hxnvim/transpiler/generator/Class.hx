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

	function generateDefinitionKind(params:Array<Param>, args:Array<Arg>, ret:LiteralType, ?expr:Expr) {
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

	/* function generateFacadedMethod(method:Function, opt:Bool) {
		final name = method.name.toFieldName();
		final methodName = '__${name}';
		final facadeName = name;

		final doc = method.doc;
		final methodDoc = "";
		final facadeDoc = doc;

		final methodMeta = method.meta.copy();
		if (!methodMeta.exists(m -> switch (m) {
			case SymbolMeta.Native(_): true;
			case _: false;
		})) {
			methodMeta.unshift(SymbolMeta.Native(method.name));
		}
		if (opt) {
			methodMeta.unshift(SymbolMeta.Optional);
		}

		final meta = this.generateMethodMeta(methodMeta, method.type.overloads);
		final methodMeta = meta.filter(m -> switch (m) {
			case {name: ":deprecated"}: false;
			case _: true;
		});
		final facadeMeta = meta.filter(m -> switch (m) {
			case {name: ":native"}: false;
			case {name: ":overload"}: false;
			case _: true;
		});

		final access = this.generateMethodAccess(method.access);
		final methodAccess = [Access.APrivate].concat(access.filter(a -> switch (a) {
			case Access.APublic: false;
			case Access.APrivate: false;
			case _: true;
		}));
		final facadeAccess = [Access.AInline].concat(access.filter(a -> switch (a) {
			case AExtern: false;
			case _: true;
		}));

		final params = method.type.params.map(p -> ({
			name: p.name,
			constraints: p.constraints.map(c -> new LiteralTypeGenerator().generate(c)),
		} : TypeParamDecl));
		final args = method.type.args.map(a -> ({
			name: a.name,
			type: new LiteralTypeGenerator().generate(a.type),
			opt: a.opt,
		} : FunctionArg));
		final ret = new LiteralTypeGenerator().generate(method.type.ret);
		final facadeRet = method.type.ret.is("Multireturn") ? new LiteralTypeGenerator().generate(LiteralType.Any) : ret;
		final methodKind = FieldType.FFun({
			params: params,
			args: args,
			ret: ret
		});
		final methodCallArguments = method.type.args.map(a -> {
			if (a.type.isOneOf("AnyTable", "Table", "TableStructure", "TypeReference")) {
				return Target.toHelperReference('PlainTable.clean(${a.name})');
			} else {
				return a.name;
			}
		});
		final facade = 'return ${methodName}(${methodCallArguments.join(",")})';
		final facadeKind = FieldType.FFun({
			params: params,
			args: args,
			ret: facadeRet,
			expr: macro $b{[macro $i{facade}]},
		});

		final method = this.generateFieldDefinition(methodName, methodDoc, methodMeta, methodAccess, methodKind);
		final facade = this.generateFieldDefinition(facadeName, facadeDoc, facadeMeta, facadeAccess, facadeKind);

		return {method: method, facade: facade};
	}*/
	function generateFacadeDefinition(facadedName:String, name:String, doc:String, meta:Array<MetadataEntry>, access:Array<Access>, signature:Signature) {
		final facadeName = name;
		final facadeDoc = doc;
		final facadeMeta = meta.filter(m -> switch (m) {
			case {name: ":native"}: false;
			case {name: ":overload"}: false;
			case _: true;
		});
		final facadeAccess = [Access.AInline].concat(access.filter(a -> switch (a) {
			case AExtern: false;
			case _: true;
		}));
		final returnTypes = switch (signature.ret) {
			case LiteralType.Multireturn(rs):
				rs.map(r -> switch (r) {
					case LiteralType.Void: Target.toHelperReference("Nothing");
					case LiteralType.Nil: Target.toHelperReference("Nothing");
					case t: new LiteralTypeGenerator().generateType(r);
				});
			case r: [new LiteralTypeGenerator().generateType(r)];
		};
		final returnType = switch (returnTypes) {
			case [r]: r;
			case r: Target.toHelperReference('Multireturn.Return${returnTypes.length}<${returnTypes.join(", ")}>');
		}

		final pureArgs = signature.args.fold((arg:Arg, pures:Array<String>) -> {
			if (arg.type.isOneOf("AnyTable", "Table", "TableStructure", "TypeReference")) {
				pures.push('${arg.name} = ${Target.toHelperReference("Arg")}.pure(${arg.name})');
			}
			return pures;
		}, []);
		final callArgs = signature.args.map(a -> switch (a.type) {
			case LiteralType.Rest(_): "..." + a.name;
			case _: a.name;
		});
		final call = '${facadedName}(${callArgs.join(", ")})';
		final callResultAssignment = 'final result = ${call}';
		final returnStatement = switch (returnTypes) {
			case [r]: 'return result';
			case r:
				final returnArgs = returnTypes.mapi((i, t) -> 'result._${i}');
				'return new ${returnType}(${returnArgs.join(", ")})';
		}
		final facadeSignature = {
			params: signature.params,
			args: signature.args,
			ret: LiteralType.Override(returnType),
			expr: macro $b{
				pureArgs.map(arg -> macro $i{arg}).concat([macro $i{callResultAssignment}, macro $i{returnStatement}])
			}
		}
		final facadeKind = this.generateDefinitionKind(facadeSignature.params, facadeSignature.args, facadeSignature.ret, facadeSignature.expr);

		return this.generateDefinition(facadeName, facadeDoc, facadeMeta, facadeAccess, facadeKind);
	}

	function generateFacadedDefinition(name:String, doc:String, meta:Array<MetadataEntry>, access:Array<Access>, signature:Signature) {
		final methodName = '__${name}';
		final methodDoc = doc;
		final methodMeta = meta.copy().filter(m -> switch (m) {
			case {name: ":deprecated"}: false;
			case _: true;
		});
		if (!methodMeta.exists(m -> switch (m) {
			case {name: ':native'}: true;
			case _: false;
		})) {
			methodMeta.unshift(new MetaGenerator("native", [macro $v{method.name}]).generate());
		}
		final methodAccess = [Access.APrivate].concat(access.filter(a -> switch (a) {
			case Access.APublic: false;
			case Access.APrivate: false;
			case _: true;
		}));
		final methodKind = this.generateDefinitionKind(signature.params, signature.args, signature.ret);

		return this.generateDefinition(methodName, methodDoc, methodMeta, methodAccess, methodKind);
	}

	function facaded() {
		return this.method.type.ret.is("Multireturn")
			|| this.method.type.args.exists(arg -> arg.type.isOneOf("AnyTable", "Table", "TableStructure", "TypeReference"));
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
		final meta = this.generateMeta(methodMeta, this.method.type.overloads);
		final access = this.generateAccess(this.method.access);
		final signature = this.method.type;

		if (this.facaded()) {
			final facadedDefinition = this.generateFacadedDefinition(name, doc, meta, access, signature);

			return [
				facadedDefinition,
				this.generateFacadeDefinition(facadedDefinition.name, name, doc, meta, access, signature)
			];
		}

		return [
			this.generateDefinition(name, doc, meta, access, this.generateDefinitionKind(signature.params, signature.args, signature.ret))
		];
	}
}

private abstract class ClassGenerator {
	final table:Table;

	public function new(table:Table) {
		this.table = table;
	}

	function generateFieldDefinition(name:String, doc:String, meta:Array<MetadataEntry>, access:Array<Access>, kind:FieldType) {
		return {
			meta: meta,
			access: access,
			name: name,
			doc: doc,
			kind: kind,
			pos: Context.currentPos()
		};
	}

	function generatePropertyAccess(propertyAccess:Array<SymbolAccess>) {
		return propertyAccess.map(a -> switch (a) {
			case SymbolAccess.Private: APrivate;
			case symbolAccess: throw 'Unexpected method access for property ${symbolAccess}';
		});
	}

	function generatePropertyMeta(propertyMeta:Array<SymbolMeta>) {
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

	function generateProperty(property:Variable, opt:Bool) {
		final name = property.name.toFieldName();

		final doc = property.doc;

		final propertyMeta = property.meta.copy();
		if (name != property.name) {
			propertyMeta.unshift(SymbolMeta.Native(property.name));
		}
		if (opt) {
			propertyMeta.unshift(SymbolMeta.Optional);
		}

		final meta = this.generatePropertyMeta(propertyMeta);

		final access = this.generatePropertyAccess(property.access);

		final kind = FieldType.FVar(new LiteralTypeGenerator().generate(property.type));

		return this.generateFieldDefinition(name, doc, meta, access, kind);
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

class DataMethodGenerator extends MethodGenerator {
	override function generateAccess(methodAccess:Array<SymbolAccess>) {
		return [AExtern].concat(super.generateAccess(methodAccess));
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
	override function generatePropertyAccess(propertyAccess:Array<SymbolAccess>) {
		return [AExtern].concat(super.generatePropertyAccess(propertyAccess));
	}

	override function generateMethod(method:Function, opt:Bool) {
		return new DataMethodGenerator(method, opt).generate();
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

class SingletonMethodGenerator extends MethodGenerator {
	override function generateAccess(methodAccess:Array<SymbolAccess>) {
		return [AStatic].concat(super.generateAccess(methodAccess));
	}
}

// TODO: detect when a function is treated as a method, and automatically add the first self argument
class SingletonClassGenerator extends ClassGenerator {
	override function generatePropertyAccess(propertyAccess:Array<SymbolAccess>) {
		return [AStatic].concat(super.generatePropertyAccess(propertyAccess));
	}

	override function generateMethod(method:Function, opt:Bool) {
		return new SingletonMethodGenerator(method, opt).generate();
	}
}
