package externs.module;

@:luaRequire("vim.lsp.log") extern class Vim_Lsp_Log {
	/**
		```lua
		(global) vim.lsp.log.DEBUG: unknown
		```
	**/
	extern var DEBUG : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.ERROR: unknown
		```
	**/
	extern var ERROR : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.INFO: unknown
		```
	**/
	extern var INFO : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.OFF: unknown
		```
	**/
	extern var OFF : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.TRACE: unknown
		```
	**/
	extern var TRACE : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.WARN: unknown
		```
	**/
	extern var WARN : Dynamic;
	/**
		```lua
		(global) vim.lsp.log.debug: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	extern function debug(___:haxe.Rest<Any>):Null<Bool>;
	/**
		```lua
		(global) vim.lsp.log.error: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	extern function error(___:haxe.Rest<Any>):Null<Bool>;
	/**
		```lua
		function log.get_filename()
		  -> log: string
		```
		
		---
		
		 Returns the log filename.
		
		@*return* `log` — filename
	**/
	extern static function get_filename():String;
	/**
		```lua
		function log.get_level()
		  -> current: integer
		```
		
		---
		
		 Gets the current log level.
		
		@*return* `current` — log level
	**/
	extern static function get_level():Int;
	/**
		```lua
		(global) vim.lsp.log.info: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	extern function info(___:haxe.Rest<Any>):Null<Bool>;
	/**
		```lua
		(global) vim.lsp.log.levels: table<integer, string>|table<string, integer>
		```
		
		---
		
		 Log level dictionary with reverse lookup as well.
		
		 Can be used to lookup the number from the name or the name from the number.
		 Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
		 Level numbers begin with "TRACE" at 0
		 @nodoc
	**/
	extern var levels : haxe.extern.EitherType<lua.Table<String, Int>, lua.Table<Int, String>>;
	/**
		```lua
		function log.set_format_func(handle: function)
		```
		
		---
		
		 Sets formatting function used to format logs
		
		@*param* `handle` — function to apply to logging arguments, pass vim.inspect for multi-line formatting
	**/
	extern static function set_format_func(handle:haxe.Constraints.Function):Dynamic;
	/**
		```lua
		function log.set_level(level: string|integer)
		```
		
		---
		
		 Sets the current log level.
		
		@*param* `level` — One of |vim.log.levels|
	**/
	extern static function set_level(level:haxe.extern.EitherType<String, Int>):Dynamic;
	/**
		```lua
		function log.should_log(level: integer)
		  -> boolean
		```
		
		---
		
		 Checks whether the level is sufficient for logging.
		
		@*param* `level` — log level
		
		@*return* — : true if would log, false if not
	**/
	extern static function should_log(level:Int):Bool;
	/**
		```lua
		(global) vim.lsp.log.trace: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	extern function trace(___:haxe.Rest<Any>):Null<Bool>;
	/**
		```lua
		(global) vim.lsp.log.warn: fun(...any):boolean?
		```
		
		---
		
		 @nodoc
		
		---
		
		```lua
		function (...: any)
		  -> boolean?
		```
	**/
	extern function warn(___:haxe.Rest<Any>):Null<Bool>;
}