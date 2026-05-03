package externs.module;

@:native("vim.provider.ruby") extern class Vim_Provider_Ruby {
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
		  -> string
		  2. string
		```
	**/
	extern static function detect():Dynamic;
	/**
		```lua
		function M.require(host: any)
		```
	**/
	extern static function require(host:Dynamic):Dynamic;
	/**
		```lua
		function M.start(plugin_path: any)
		```
	**/
	extern static function start(plugin_path:Dynamic):Dynamic;
}