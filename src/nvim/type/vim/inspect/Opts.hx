package nvim.type.vim.inspect;

/**
	```lua
	(class) vim.inspect.Opts
	```
	
	---
	
	 @nodoc
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.inspect.Opts.depth: integer?
		```
	**/
	@:optional
	var depth : Null<Int>;
	/**
		```lua
		(field) vim.inspect.Opts.newline: string?
		```
	**/
	@:optional
	var newline : Null<String>;
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
	@:optional
	var process : Null<(item:Any, path:Array<String>) -> Any>;
}