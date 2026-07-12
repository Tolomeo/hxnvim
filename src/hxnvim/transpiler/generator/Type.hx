package hxnvim.transpiler.generator;

import hxnvim.transpiler.generator.Meta.MetaGenerator;
import hxnvim.transpiler.parser.Type.LiteralTypeParser;
import haxe.Exception;
import haxe.macro.Expr;
import haxe.macro.Context;

using haxe.macro.ComplexTypeTools;
using hxnvim.common.NullTools;
using hxnvim.common.StringTools;
using hxnvim.common.ArrayTools;
using hxnvim.transpiler.symbol.SymbolTools;

import hxnvim.target.Target;
import hxnvim.transpiler.symbol.Symbol;

class LiteralTypeGenerator {
	private final origin:LiteralType;

	public function new(origin:LiteralType) {
		this.origin = origin;
	}

	function generateOptionalType(type:LiteralType) {
		return 'Null<${new LiteralTypeGenerator(type).generateAsString()}>';
	}

	function generateUnionType(union:Array<LiteralType>) {
		function makeUnion(members:Array<String>):String {
			return switch (members.copy()) {
				case [], [_]:
					throw new Exception('Error generating union type out of ${union}');
				case [left, right]:
					'haxe.extern.EitherType<${left}, ${right}>';
				case m:
					'haxe.extern.EitherType<${m.shift()}, ${makeUnion(m)}>';
			}
		}

		final types = union.map(t -> new LiteralTypeGenerator(t).generateAsString()).unique();
		final nonNullableTypes = types.filter(type -> type != "Void");
		final nonNullableUnion = switch (nonNullableTypes) {
			case [t]: t;
			case t: makeUnion(t);
		}

		return (types.length != nonNullableTypes.length) ? 'Null<${nonNullableUnion}>' : nonNullableUnion;
	}

	function generateArrayType(itemsType:LiteralType) {
		return 'lua.Table<Int, ${new LiteralTypeGenerator(itemsType).generateAsString()}>';
	}

	function generateFunctionType(signature:Signature) {
		final args = signature.args.map(argument -> switch (argument.name) {
			case '...': '___:haxe.Rest<${new LiteralTypeGenerator(argument.type).generateAsString()}>';
			case argumentName: switch (argument.opt) {
					case true: '?${argumentName}:${new LiteralTypeGenerator(argument.type).generateAsString()}';
					case false: '${argumentName}:${new LiteralTypeGenerator(argument.type).generateAsString()}';
				}
		});

		final ret = new LiteralTypeGenerator(signature.ret).generateAsString();

		return '(${args.join(", ")}) -> ${ret}';
	}

	function generateRestType(type:LiteralType) {
		return 'haxe.Rest<${new LiteralTypeGenerator(type).generateAsString()}>';
	}

	function generateMultireturnType(returnTypes:Array<LiteralType>) {
		if (returnTypes.length > 6) {
			throw new Exception('Error generating multireturn type: too many values in ${returnTypes}, the maximum allowed is currently 6');
		}

		final types = returnTypes.map(r -> switch (r) {
			case LiteralType.Void: Target.toHelperReference("Nothing");
			case LiteralType.Nil: Target.toHelperReference("Nothing");
			case r: new LiteralTypeGenerator(r).generateAsString();
		}).padEnd(6, Target.toHelperReference("Nothing"));

		return Target.toHelperReference('Multireturn<${types.join(", ")}>');
	}

	function generateTableStructure(fields:Array<{name:String, type:LiteralType}>) {
		final entries = fields.map(field -> ({
			name: field.name,
			type: new LiteralTypeGenerator(field.type).generateAsString(),
			opt: field.type.isNullable()
		})).map(entry -> (entry.opt ? '?${entry.name}' : entry.name) + ':${entry.type}');

		return '{ ${entries.join(", ")} }';
	}

	function generateTableType(key:LiteralType, value:LiteralType) {
		return 'lua.Table<${new LiteralTypeGenerator(key).generateAsString()}, ${new LiteralTypeGenerator(value).generateAsString()}>';
	}

	public function generateAsString() {
		return this.generate().toString();
	}

	function generateDynamic() {
		return ComplexType.TPath({name: "Dynamic", params: [], pack: []});
	}

	function generateAny() {
		return ComplexType.TPath({name: "Any", params: [], pack: []});
	}

	function generateBool() {
		return ComplexType.TPath({name: "Bool", params: [], pack: []});
	}

	function generateFunctionConstraint() {
		return ComplexType.TPath({
			name: "Constraints",
			params: [],
			sub: "Function",
			pack: ["haxe"]
		});
	}

	function generateInt() {
		return ComplexType.TPath({name: "Int", params: [], pack: []});
	}

	function generateUserData() {
		return ComplexType.TPath({name: "UserData", params: [], pack: ["lua"]});
	}

	function generateVoid() {
		return ComplexType.TPath({name: "Void", params: [], pack: []});
	}

	function generateFloat() {
		return ComplexType.TPath({name: "Float", params: [], pack: []});
	}

	function generateString() {
		return ComplexType.TPath({name: "String", params: [], pack: []});
	}

	function generateArray(type:LiteralType) {
		return ComplexType.TPath({
			name: "Array",
			params: [TypeParam.TPType(new LiteralTypeGenerator(type).generate())],
			pack: []
		});
	}

	function generateAnyTable() {
		return ComplexType.TPath({
			name: "Table",
			params: [],
			sub: "AnyTable",
			pack: ["lua"]
		});
	}

	function generateNullable(type:LiteralType) {
		return ComplexType.TPath({
			name: "Null",
			params: [TypeParam.TPType(new LiteralTypeGenerator(type).generate())],
			pack: []
		});
	}

	function generateUnion(types:Array<LiteralType>) {
		function makeUnion(members:Array<ComplexType>) {
			return switch (members.copy()) {
				case [], [_]:
					throw new Exception('Error generating union type out of ${types}');
				case [left, right]:
					ComplexType.TPath({
						name: "EitherType",
						pack: ["haxe", "extern"],
						params: [TypeParam.TPType(left), TypeParam.TPType(right),]
					});
				case m:
					ComplexType.TPath({
						name: "EitherType",
						pack: ["haxe", "extern"],
						params: [TypeParam.TPType(m.shift()), TypeParam.TPType(makeUnion(m))]
					});
			}
		}

		final nonNullableTypes = types.filter((t) -> switch (t) {
			case LiteralType.Nil: false;
			case LiteralType.Void: false;
			case _: true;
		});
		final nonNullableUnion = nonNullableTypes.map(t -> new LiteralTypeGenerator(t).generate());
		final nonNullableUniqueUnion = nonNullableUnion.fold((t:ComplexType, ut:Array<ComplexType>) -> {
			if (!ut.exists((u) -> u.toString() == t.toString())) {
				ut.push(t);
			}
			return ut;
		}, []);
		final type = switch (nonNullableUniqueUnion) {
			case [t]: t;
			case t: makeUnion(t);
		}

		return if (types.length == nonNullableTypes.length) {
			type;
		} else {
			ComplexType.TPath({
				name: "Null",
				params: [TypeParam.TPType(type)],
				pack: []
			});
		}
	}

	function generateFunction(signature:Signature) {
		final args = signature.args.map(argument -> switch (argument.name) {
			case "...": ComplexType.TNamed("___", new LiteralTypeGenerator(LiteralType.Rest(argument.type)).generate());
			case argumentName:
				final type = ComplexType.TNamed(argument.name, new LiteralTypeGenerator(argument.type).generate());
				if (argument.opt) {
					ComplexType.TOptional(type);
				} else {
					type;
				}
		});
		final ret = new LiteralTypeGenerator(signature.ret).generate();

		return ComplexType.TFunction(args, ret);
	}

	function generateRest(type:LiteralType) {
		return ComplexType.TPath({
			name: "Rest",
			pack: ["haxe"],
			params: [TypeParam.TPType(new LiteralTypeGenerator(type).generate())]
		});
	}

	function generateMultireturn(types:Array<LiteralType>) {
		if (types.length > 6) {
			throw new Exception('Error generating multireturn type: too many values in ${types}, the maximum allowed is currently 6');
		}

		final nothing = ComplexType.TPath({
			name: "Nothing",
			pack: Target.helperPack(),
			params: []
		});
		final multireturnTypes = types.map(t -> switch (t) {
			case LiteralType.Void: nothing;
			case LiteralType.Nil: nothing;
			case type: new LiteralTypeGenerator(type).generate();
		}).padEnd(6, nothing);

		return ComplexType.TPath({
			name: "Multireturn",
			pack: Target.helperPack(),
			params: multireturnTypes.map(t -> TypeParam.TPType(t))
		});
	}

	function generateTable(key:LiteralType, value:LiteralType) {
		return ComplexType.TPath({
			name: "Table",
			pack: ["lua"],
			params: [
				TypeParam.TPType(new LiteralTypeGenerator(key).generate()),
				TypeParam.TPType(new LiteralTypeGenerator(value).generate()),
			]
		});
	}

	function generateAnonymousStructure(fields:Array<{name:String, type:LiteralType}>) {
		final structureFields = fields.map(field -> ({
			name: field.name,
			doc: "",
			kind: FieldType.FVar(new LiteralTypeGenerator(field.type).generate(), null),
			access: [],
			meta: field.type.isNullable() ? [new MetaGenerator("optional").generate()] : [],
			pos: null
		}));

		return ComplexType.TAnonymous(structureFields);
	}

	public function generateTypeReference(name:String) {
		return ComplexType.TPath({
			name: name,
			params: [],
			pack: []
		});
	}

	public function generateAnnotationReference(reference:String) {
		final annotationPack = Target.annotationPack();
		final referencePath = reference.split(".");
		final pack = referencePath.initial().map(p -> p.toLowerCase().toIdentifierName());
		final name = referencePath.last().toTypeName();

		return ComplexType.TPath({
			name: name,
			params: [],
			pack: annotationPack.concat(pack)
		});
	}

	public function generateModuleReference(reference:String) {
		final modulePack = Target.modulePack();
		final referencePath = reference.split(".");
		final pack = referencePath.initial().map(p -> p.toLowerCase().toIdentifierName());
		final name = referencePath.last().toTypeName();

		return ComplexType.TPath({
			name: name,
			params: [],
			pack: modulePack.concat(pack)
		});
	}

	function generateHelperReference(name:String, ?params:Array<LiteralType>, ?sub:String) {
		return ComplexType.TPath({
			name: name,
			pack: Target.helperPack(),
			params: params.or([]).map(p -> TypeParam.TPType(new LiteralTypeGenerator(p).generate())),
			sub: sub
		});
	}

	public function generate() {
		return switch (this.origin) {
			case LiteralType.Unknown:
				this.generateDynamic();
			case LiteralType.Any:
				this.generateAny();
			case LiteralType.Boolean:
				this.generateBool();
			case LiteralType.AnyFunction:
				this.generateFunctionConstraint();
			case LiteralType.Integer:
				this.generateInt();
			case LiteralType.UserData:
				this.generateUserData();
			case LiteralType.Nil:
				this.generateVoid();
			case LiteralType.Void:
				this.generateVoid();
			case LiteralType.Number:
				this.generateFloat();
			case LiteralType.Str:
				this.generateString();
			case LiteralType.Array(type):
				this.generateArray(type);
			case LiteralType.AnyTable:
				this.generateAnyTable();
			case LiteralType.NumericLiteral(_):
				this.generateFloat();
			case LiteralType.StringLiteral(_):
				this.generateString();
			case LiteralType.BooleanLiteral(_):
				this.generateBool();
			case LiteralType.Optional(type):
				this.generateNullable(type);
			case LiteralType.Union(types):
				this.generateUnion(types);
			case LiteralType.Function(signature):
				this.generateFunction(signature);
			case LiteralType.Rest(type):
				this.generateRest(type);
			case LiteralType.Multireturn(types):
				this.generateMultireturn(types);
			case LiteralType.Table(key, value):
				this.generateTable(key, value);
			case LiteralType.TableStructure(fields):
				this.generateAnonymousStructure(fields);
			case LiteralType.GenericTypeReference(name):
				this.generateTypeReference(name);
			case LiteralType.AnnotationReference(name):
				this.generateAnnotationReference(name);
			case LiteralType.ModuleReference(name):
				this.generateModuleReference(name);
			case LiteralType.HelperReference(name, params, sub):
				this.generateHelperReference(name, params, sub);
			case _: throw new Exception('Error generating type string: unimplemented type ${this.origin}');
		}
	}
}
