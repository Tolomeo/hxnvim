package externs.type;

/**
	```lua
	(class) vim.regex
	```
	
	---
	
	 @nodoc
**/
@:native("vim.regex") extern class Vim_Regex {
	/**
		```lua
		(method) vim.regex:match_line(bufnr: integer, line_idx: integer, start?: integer, end_?: integer)
		  -> integer?
		  2. integer?
		```
		
		---
		
		 Matches line at `line_idx` (zero-based) in buffer `bufnr`. Match is restricted to byte index
		 range `start` and `end_` if given, otherwise see |regex:match_str()|. Returned byte indices are
		 relative to `start` if given.
		
		@*return* — match start (byte index) relative to `start`, or `nil` if no match
		
		@*return* — match end (byte index) relative to `start`, or `nil` if no match
	**/
	extern function match_line(bufnr:Int, line_idx:Int, ?start:Int, ?end_:Int):vim._internal.Multireturn<Null<Int>, Null<Int>>;
	/**
		```lua
		(method) vim.regex:match_str(str: string)
		  -> integer?
		  2. integer?
		```
		
		---
		
		 Matches string `str` against this regex. To match the string precisely, surround the regex with
		 "^" and "$". Returns the byte indices for the start and end of the match, or `nil` if there is
		 no match. Because any integer is "truthy", `regex:match_str()` can be directly used as
		 a condition in an if-statement.
		
		@*return* — match start (byte index), or `nil` if no match
		
		@*return* — match end (byte index), or `nil` if no match
	**/
	extern function match_str(str:String):vim._internal.Multireturn<Null<Int>, Null<Int>>;
}