package hxnvim.transpiler.symbol;

typedef Metadata = {name:String, ?params:Array<String>};
typedef LiteralType = String;

typedef ParsedParam = {
	name:String,
	constraints:Array<LiteralType>
}

typedef ParsedArg = {name:String, type:LiteralType, opt:Bool};
typedef ParsedReturn = LiteralType;

enum ParsedAccess {
	Public;
	Private;
	Static;
	Overload;
}

typedef Variable = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	access:Array<ParsedAccess>,
	type:LiteralType,
}

typedef Function = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	access:Array<ParsedAccess>,
	params:Array<ParsedParam>,
	args:Array<ParsedArg>,
	ret:ParsedReturn,
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
	access:Array<ParsedAccess>,
	fields:Array<TableField>
}

typedef Enumerator = {
	name:String,
	doc:String,
	meta:Array<Metadata>,
	type:LiteralType,
	fields:Map<String, String>
}

enum ParsedSymbol {
	ParsedTable(table:Table);
	ParsedAlias(alias:Alias);
	ParsedEnumerator(enumerator:Enumerator);
}
