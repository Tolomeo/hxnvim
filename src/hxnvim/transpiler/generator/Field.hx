package hxnvim.transpiler.generator;

import haxe.ds.Option;
import haxe.Exception;
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Expr.Field;

using hxnvim.common.NullTools;
using hxnvim.common.StringTools;
using hxnvim.common.ArrayTools;
using hxnvim.transpiler.symbol.SymbolTools;

import hxnvim.Logger;
import hxnvim.target.Target;
import hxnvim.transpiler.State;
import hxnvim.transpiler.symbol.Symbol;
import hxnvim.transpiler.generator.Meta;
import hxnvim.transpiler.generator.Type;

abstract class FieldGenerator {
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
}

class PropertyGenerator extends FieldGenerator {
	final property:Variable;
	final opt:Bool;

	public function new(property:Variable, opt:Bool) {
		this.property = property;
		this.opt = opt;
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

class MethodGenerator extends FieldGenerator {
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

	function generateMeta(methodMeta:Array<SymbolMeta>, overloads:Array<Signature>) {
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
			final overloadType = 'function ${new LiteralTypeGenerator().generateType(LiteralType.Function(o)).replace("->", ":")} {}';
			methodMetas.push(new MetaGenerator("overload", [macro $i{overloadType}]).generate());
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

	public var facaded(get, never):Bool;

	function get_facaded() {
		return this.method.type.ret.is("Multireturn")
			|| this.method.type.args.exists(arg -> arg.type.isOneOf("AnyTable", "Table", "TableStructure", "TypeReference"));
	}

	function generateFacade(method:Field, name:String, doc:String, meta:Array<MetadataEntry>, access:Array<Access>, signature:Signature) {
		final facadeParams = signature.params.copy();
		final facadeArgs = signature.args.map((arg -> {
			final name = arg.name;
			final type = switch (arg.type) {
				case LiteralType.Array(itemsType): LiteralType.Override('Array<${new LiteralTypeGenerator().generateType(itemsType)}>');
				case LiteralType.Table(LiteralType.Integer, itemsType): LiteralType.Override('Array<${new LiteralTypeGenerator().generateType(itemsType)}>');
				case argType: argType;
			}
			final shadow = switch (arg.type) {
				case LiteralType.Table(LiteralType.Integer,
					itemsType): Option.Some('final ${name}:'
						+ Target.toHelperReference('Native.LuaArray<${new LiteralTypeGenerator().generateType(itemsType)}>')
						+ ' = ${name}');
				case LiteralType.Array(itemsType): Option.Some('final ${name}:'
						+ Target.toHelperReference('Native.LuaArray<${new LiteralTypeGenerator().generateType(itemsType)}>')
						+ ' = ${name}');
				case argType if (argType.isOneOf("AnyTable", "Table", "TableStructure", "TypeReference")):
					Option.Some('final ${name}:'
						+ Target.toHelperReference('Native.LuaObject<${new LiteralTypeGenerator().generateType(argType)}>')
						+ ' = ${name}');
				case _: Option.None;
			}
			final call = switch (arg.type) {
				case LiteralType.Rest(_): '...${name}';
				case _: name;
			}
			final opt = arg.opt;

			return {
				name: name,
				type: type,
				opt: opt,
				shadow: shadow,
				call: call,
			};
		}));

		final facadeReturn = switch (signature.ret) {
			case LiteralType.Multireturn(multireturnTypes):
				final returnTypes = multireturnTypes.map(r -> switch (r) {
					case returnType if (returnType.isOneOf("Void", "Nil")): Target.toHelperReference("Nothing");
					case returnType: new LiteralTypeGenerator().generateType(returnType);
				});
				Target.toHelperReference('Multireturn.Return${returnTypes.length}<${returnTypes.join(", ")}>');
			case returnType: new LiteralTypeGenerator().generateType(returnType);
		}

		final argShadows = facadeArgs.fold((arg:{name:String, shadow:Option<String>}, _shadows:Array<String>) -> {
			return switch (arg.shadow) {
				case Some(shadow): _shadows.concat([shadow]);
				case None: _shadows;
			}
		}, []);

		final call = 'return ${method.name}(${facadeArgs.map(a -> a.call).join(", ")})';

		final expr = macro $b{
			argShadows.map(arg -> macro $i{arg}).concat([macro $i{call}])
		}

		return this.generateDefinition(name, doc, meta, access, this.generateFunctionKind(facadeParams, facadeArgs, LiteralType.Override(facadeReturn), expr));
	}

	function generateFacades(field:Field) {
		final facadeName = field.name;
		field.name = '__${field.name}';

		final facadeDoc = field.doc;
		field.doc = "";

		final facadeMeta = field.meta.filter(m -> switch (m) {
			case {name: ":native"}: false;
			case {name: ":overload"}: false;
			case {name: ":luaDotMethod"}: false;
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
			case Access.AExtern: false;
			case _: true;
		}));
		if (this.method.overloads.length > 0) {
			facadeAccess.unshift(Access.AOverload);
		}

		field.access = [Access.APrivate].concat(field.access.filter(a -> switch (a) {
			case Access.APublic: false;
			case Access.APrivate: false;
			case _: true;
		}));

		final fields = [field];

		[this.method.type].concat(this.method.overloads).iter(signature -> {
			fields.push(this.generateFacade(field, facadeName, facadeDoc, facadeMeta, facadeAccess, signature));
		});

		return fields;
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

		return this.generateFacades(field);
	}
}

class AnnotationPropertyGenerator extends PropertyGenerator {
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

class AnnotationMethodGenerator extends MethodGenerator {
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

	override function generateMeta(methodMeta:Array<SymbolMeta>, overloads:Array<Signature>) {
		final dataClassMethodMeta = new Array<MetadataEntry>();

		if (!methodMeta.contains(SymbolMeta.Method)) {
			dataClassMethodMeta.push(new MetaGenerator("luaDotMethod").generate());
		}

		return dataClassMethodMeta.concat(super.generateMeta(methodMeta, overloads));
	}

	override function generateFacades(field:Field) {
		final fields = super.generateFacades(field);

		return switch (fields) {
			case [field]: [field];
			case [field, facade]: [field, facade];
			case overloadedFields:
				Logger.warn('Method facade overloads are currently unsupported in data classes and they will be removed',
					'${State.consume(t -> t.output.qualifiedName)}:${this.method.name}');
				final field = overloadedFields[0];
				final facade = overloadedFields[1];
				facade.access = facade.access.filter(a -> switch (a) {
					case Access.AOverload: false;
					case _: true;
				});
				[field, facade];
		}
	}
}

class NamespacePropertyGenerator extends PropertyGenerator {
	override function generateAccess(propertyAccess:Array<SymbolAccess>) {
		return [AStatic].concat(super.generateAccess(propertyAccess));
	}
}

class NamespaceMethodGenerator extends MethodGenerator {
	override function generateAccess(methodAccess:Array<SymbolAccess>) {
		return [AStatic].concat(super.generateAccess(methodAccess));
	}
}

class ModuleMethodGenerator extends MethodGenerator {
	override function generateMeta(methodMeta:Array<SymbolMeta>, overloads:Array<Signature>) {
		final instanceClassMethodMeta = new Array<MetadataEntry>();

		if (!methodMeta.contains(SymbolMeta.Method)) {
			instanceClassMethodMeta.push(new MetaGenerator("luaDotMethod").generate());
		}

		return instanceClassMethodMeta.concat(super.generateMeta(methodMeta, overloads));
	}
}
