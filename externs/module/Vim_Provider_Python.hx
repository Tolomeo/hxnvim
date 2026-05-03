package externs.module;

@:native("vim.provider.python") extern class Vim_Provider_Python {
	/**
		```lua
		function M.call(method: any, args: any)
		  -> nil
		```
	**/
	extern static function call(method:Dynamic, args:Dynamic):Dynamic;
	/**
		```lua
		function M.detect_by_module(module: string)
		  -> path: string?
		  2. error: string?
		```
		
		---
		
		@*return* `path` — to detected python, if any; nil if not found
		
		@*return* `error` — message if python can't be detected by {module}; nil if success
	**/
	extern static function detect_by_module(module:String):vim._internal.Multireturn<Null<String>, Null<String>>;
	/**
		```lua
		function M.require(host: any)
		```
	**/
	extern static function require(host:Dynamic):Dynamic;
	/**
		```lua
		function M.start()
		```
	**/
	extern static function start():Dynamic;
}