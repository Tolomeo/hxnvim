package nvim.type.vim.fn.getscriptinfo;

/**
	```lua
	(class) vim.fn.getscriptinfo.ret
	```
**/
@:structInit class Ret {
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.autoload: false
		```
	**/
	var autoload : Bool;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.functions: string[]?
		```
	**/
	@:optional
	var functions : Null<Array<String>>;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.name: string
		```
	**/
	var name : String;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.sid: string
		```
	**/
	var sid : String;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.variables: table<string, any>?
		```
	**/
	@:optional
	var variables : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.fn.getscriptinfo.ret.version: 1
		```
	**/
	var version : Float;
}