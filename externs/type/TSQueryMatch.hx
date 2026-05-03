package externs.type;

/**
	```lua
	(class) TSQueryMatch
	```
**/
@:native("TSQueryMatch") extern class TSQueryMatch {
	/**
		```lua
		(field) TSQueryMatch.captures: fun(self: TSQueryMatch):table<integer, TSNode[]>
		```
		
		---
		
		```lua
		function (self: TSQueryMatch)
		  -> table<integer, TSNode[]>
		```
	**/
	extern function captures():lua.Table<Int, Array<externs.type.TSNode>>;
	/**
		```lua
		(method) TSQueryMatch:info()
		  -> match_id: integer
		  2. pattern_index: integer
		```
	**/
	extern function info():vim._internal.Multireturn<Int, Int>;
}