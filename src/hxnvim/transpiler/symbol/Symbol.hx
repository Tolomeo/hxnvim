package hxnvim.transpiler.symbol;

typedef Metadata = {name:String, ?params:Array<String>};
typedef LiteralType = String;

enum SymbolAccess {
	Public;
	Private;
	Static;
	Overload;
}

typedef Variable = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
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
	meta:Array<Metadata>,
	access:Array<SymbolAccess>,
	params:Array<Param>,
	args:Array<Arg>,
	ret:Return,
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
	meta:Array<Metadata>,
	access:Array<SymbolAccess>,
	fields:Array<TableField>
}

typedef Enumerator = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	type:LiteralType,
	fields:Map<String, String>
}

enum Symbol {
	TableSymbol(table:Table);
	AliasSymbol(alias:Alias);
	EnumeratorSymbol(enumerator:Enumerator);
}
