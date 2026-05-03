package externs.module;

@:native("vim.re") extern class Vim_Re {
	/**
		```lua
		function vim.re.compile(string: string, defs?: table)
		  -> vim.lpeg.Pattern
		```
		
		---
		
		 Compiles the given {string} and returns an equivalent LPeg pattern. The given string may define
		 either an expression or a grammar. The optional {defs} table provides extra Lua values to be used
		 by the pattern.
		
		---
		
		```lua
		function compile(p: any, defs: any)
		  -> unknown
		```
	**/
	extern static function compile(string:String, ?defs:lua.Table.AnyTable):externs.type.Vim_Lpeg_Pattern;
	/**
		```lua
		function vim.re.find(subject: string, pattern: string|vim.lpeg.Pattern, init?: integer)
		  -> integer|nil
		  2. integer|nil
		```
		
		---
		
		 Searches the given {pattern} in the given {subject}. If it finds a match, returns the index
		 where this occurrence starts and the index where it ends. Otherwise, returns nil.
		
		 An optional numeric argument {init} makes the search starts at that position in the subject
		 string. As usual in Lua libraries, a negative value counts from the end.
		
		@*return* — : the index where the occurrence starts, nil if no match
		
		@*return* — : the index where the occurrence ends, nil if no match
		
		---
		
		```lua
		function find(s: any, p: any, i: any)
		  -> unknown
		  2. unknown|nil
		```
	**/
	extern static function find(subject:String, pattern:haxe.extern.EitherType<externs.type.Vim_Lpeg_Pattern, String>, ?init:Int):vim._internal.Multireturn<haxe.extern.EitherType<Int, Void>, haxe.extern.EitherType<Int, Void>>;
	/**
		```lua
		function vim.re.gsub(subject: string, pattern: string|vim.lpeg.Pattern, replacement: string)
		  -> string
		```
		
		---
		
		 Does a global substitution, replacing all occurrences of {pattern} in the given {subject} by
		 {replacement}.
		
		---
		
		```lua
		function gsub(s: any, p: any, rep: any)
		```
	**/
	extern static function gsub(subject:String, pattern:haxe.extern.EitherType<externs.type.Vim_Lpeg_Pattern, String>, replacement:String):String;
	/**
		```lua
		function vim.re.match(subject: string, pattern: string|vim.lpeg.Pattern, init?: integer)
		  -> integer|vim.lpeg.Pattern|nil
		```
		
		---
		
		 Matches the given {pattern} against the given {subject}, returning all captures.
		See: [vim.lpeg.match](file:///usr/local/share/nvim/runtime/lua/vim/_meta/lpeg.lua#64#9) ()
		
		---
		
		```lua
		function match(s: any, p: any, i: any)
		```
	**/
	extern static function match(subject:String, pattern:haxe.extern.EitherType<externs.type.Vim_Lpeg_Pattern, String>, ?init:Int):haxe.extern.EitherType<Int, haxe.extern.EitherType<externs.type.Vim_Lpeg_Capture, Void>>;
	/**
		```lua
		function vim.re.updatelocale()
		```
		
		---
		
		 Updates the pre-defined character classes to the current locale.
		
		---
		
		```lua
		function updatelocale()
		```
	**/
	extern static function updatelocale():Dynamic;
}