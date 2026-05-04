package externs.type;

/**
	```lua
	(class) vim.SystemObj
	```
**/
extern class Vim_SystemObj {
	/**
		```lua
		(field) vim.SystemObj.cmd: string[]
		```
	**/
	extern var cmd : Array<String>;
	/**
		```lua
		(field) vim.SystemObj.is_closing: fun(self: vim.SystemObj):boolean
		```
		
		---
		
		```lua
		function (self: vim.SystemObj)
		  -> boolean
		```
	**/
	extern function is_closing():Bool;
	/**
		```lua
		(field) vim.SystemObj.kill: fun(self: vim.SystemObj, signal: string|integer)
		```
		
		---
		
		```lua
		function (self: vim.SystemObj, signal: string|integer)
		```
	**/
	extern function kill(signal:haxe.extern.EitherType<Int, String>):Dynamic;
	/**
		```lua
		(field) vim.SystemObj.pid: integer
		```
	**/
	extern var pid : Int;
	/**
		```lua
		(field) vim.SystemObj.wait: fun(self: vim.SystemObj, timeout?: integer):vim.SystemCompleted
		```
		
		---
		
		```lua
		function (self: vim.SystemObj, timeout?: integer)
		  -> vim.SystemCompleted
		```
	**/
	extern function wait(timeout:Int):externs.type.Vim_SystemCompleted;
	/**
		```lua
		(field) vim.SystemObj.write: fun(self: vim.SystemObj, data?: string|string[])
		```
		
		---
		
		```lua
		function (self: vim.SystemObj, data?: string|string[])
		```
	**/
	extern function write(data:haxe.extern.EitherType<String, Array<String>>):Dynamic;
}