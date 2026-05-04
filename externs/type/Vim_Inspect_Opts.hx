package externs.type;

/**
	```lua
	(class) vim.inspect.Opts
	```
	
	---
	
	 @nodoc
**/
extern class Vim_Inspect_Opts {
	/**
		```lua
		(field) vim.inspect.Opts.depth: integer?
		```
	**/
	extern var depth : Null<Int>;
	/**
		```lua
		(field) vim.inspect.Opts.newline: string?
		```
	**/
	extern var newline : Null<String>;
	/**
		```lua
		(field) vim.inspect.Opts.process: (fun(item: any, path: string[]):any)?
		```
		
		---
		
		```lua
		function (item: any, path: string[])
		  -> any
		```
	**/
	extern var process : Null<(item:Any, path:Array<String>) -> Any>;
}