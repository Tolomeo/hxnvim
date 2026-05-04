package externs.type;

@:private extern class Patterns {

}

/**
	```lua
	(class) TSQueryInfo
	```
**/
@:structInit extern class TSQueryInfo {
	/**
		```lua
		(field) TSQueryInfo.captures: string[]
		```
	**/
	extern var captures : Array<String>;
	/**
		```lua
		(field) TSQueryInfo.patterns: table<integer, (string|integer)[][]>
		```
	**/
	extern var patterns : Patterns;
}