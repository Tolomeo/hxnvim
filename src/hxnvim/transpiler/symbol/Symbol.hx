package hxnvim.transpiler.symbol;

enum LiteralType {
	Unknown;
	Builtin(value:String);
	Optional(type:LiteralType);
	Union(types:Array<LiteralType>);
	Array(itemsType:LiteralType);
	Function(signature:Signature);
	Multireturn(types:Array<LiteralType>);
	Table(key:LiteralType, value:LiteralType);
	TableStructure(fields:Array<{name:String, type:LiteralType}>);
	NumericLiteral(value:String);
	StringLiteral(value:String);
	BooleanLiteral(value:String);
	GenericTypeReference(name:String);
	TypeReference(name:String);
	ModuleReference(name:String);
	Rest(type:LiteralType);
	Override(type:String);
}

// TODO: remove overload; add protected and package
enum SymbolAccess {
	Private;
	Overload;
}

enum SymbolMeta {
	Method;
	Deprecated;
	Native(name:String);
	StructInit;
	Optional;
}

typedef Variable = {
	name:String,
	doc:String,
	meta:Array<SymbolMeta>,
	access:Array<SymbolAccess>,
	type:LiteralType,
}

typedef Param = {
	name:String,
	constraints:Array<LiteralType>
}

typedef Arg = {
	name:String,
	type:LiteralType,
	opt:Bool
};

typedef Return = LiteralType;

typedef Signature = {
	params:Array<Param>,
	args:Array<Arg>,
	ret:LiteralType,
	overloads:Array<LiteralType>
}

typedef Function = {
	name:String,
	doc:String,
	meta:Array<SymbolMeta>,
	access:Array<SymbolAccess>,
	type:Signature
}

enum TableField {
	Property(symbol:Variable, opt:Bool);
	Method(symbol:Function, opt:Bool);
}

typedef Table = {
	name:String,
	doc:String,
	meta:Array<SymbolMeta>,
	access:Array<SymbolAccess>,
	fields:Array<TableField>
}

typedef Alias = {
	name:String,
	type:LiteralType
}

typedef Enumerator = {
	name:String,
	doc:String,
	meta:Array<SymbolMeta>,
	type:LiteralType,
	fields:Map<String, String>
}

enum Symbol {
	TableSymbol(table:Table);
	AliasSymbol(alias:Alias);
	EnumeratorSymbol(enumerator:Enumerator);
}
