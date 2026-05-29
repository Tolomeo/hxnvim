package hxnvim.transpiler.symbol;

typedef LiteralType = String;

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

typedef Arg = {name:String, type:LiteralType, opt:Bool};
typedef Return = LiteralType;

typedef Function = {
	name:String,
	doc:String,
	meta:Array<SymbolMeta>,
	access:Array<SymbolAccess>,
	params:Array<Param>,
	args:Array<Arg>,
	ret:Return,
	overloads:Array<LiteralType>
}

enum TableField {
	Property(variable:Variable);
	Method(function_:Function);
}

typedef Alias = {
	name:String,
	type:LiteralType
}

typedef Table = {
	name:String,
	doc:String,
	meta:Array<SymbolMeta>,
	access:Array<SymbolAccess>,
	fields:Array<TableField>
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
