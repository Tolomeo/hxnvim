package externs.module;

@:luaRequire("vim.provider.perl") extern class Vim_Provider_Perl {
	/**
		```lua
		function M.call(method: any, args: any)
		  -> nil
		```
	**/
	extern static function call(method:Dynamic, args:Dynamic):Dynamic;
	/**
		```lua
		function M.detect()
		  -> path: string?
		  2. error: string?
		```
		
		---
		
		@*return* `path` — to detected perl, if any; nil if not found
		
		@*return* `error` — message if perl can't be detected; nil if success
	**/
	extern static function detect():vim._internal.Multireturn<Null<String>, Null<String>>;
	/**
		```lua
		function M.require(host: any, prog: any)
		```
	**/
	extern static function require(host:Dynamic, prog:Dynamic):Dynamic;
	/**
		```lua
		function M.start()
		```
	**/
	extern static function start():Dynamic;
}