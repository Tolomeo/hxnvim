package externs.module;

@:native("vim.health") extern class Vim_Health {
	/**
		```lua
		function M.error(msg: string, ...string|string[])
		```
		
		---
		
		 Reports an error.
		
		@*param* `...` — Optional advice
	**/
	extern static function error(msg:String, ___:haxe.Rest<haxe.extern.EitherType<String, Array<String>>>):Dynamic;
	/**
		```lua
		function M.info(msg: string)
		```
		
		---
		
		 Reports an informational message.
	**/
	extern static function info(msg:String):Dynamic;
	/**
		```lua
		function M.ok(msg: string)
		```
		
		---
		
		 Reports a "success" message.
	**/
	extern static function ok(msg:String):Dynamic;
	/**
		```lua
		function M.start(name: string)
		```
		
		---
		
		 Starts a new report. Most plugins should call this only once, but if
		 you want different sections to appear in your report, call this once
		 per section.
	**/
	extern static function start(name:String):Dynamic;
	/**
		```lua
		function M.warn(msg: string, ...string|string[])
		```
		
		---
		
		 Reports a warning.
		
		@*param* `...` — Optional advice
	**/
	extern static function warn(msg:String, ___:haxe.Rest<haxe.extern.EitherType<String, Array<String>>>):Dynamic;
}