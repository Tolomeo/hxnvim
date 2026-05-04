package externs.type;

/**
	```lua
	(class) vim.diff.Opts
	```
	
	---
	
	 Optional parameters:
**/
@:structInit extern class Vim_Diff_Opts {
	/**
		```lua
		(field) vim.diff.Opts.algorithm: ('histogram'|'minimal'|'myers'|'patience')?
		```
		
		---
		
		
		 Diff algorithm to use. Values:
		   - `myers`: the default algorithm
		   - `minimal`: spend extra time to generate the smallest possible diff
		   - `patience`: patience diff algorithm
		   - `histogram`: histogram diff algorithm
		 (default: `'myers'`)
	**/
	extern var algorithm : Null<String>;
	/**
		```lua
		(field) vim.diff.Opts.ctxlen: integer?
		```
		
		---
		
		Context length
	**/
	extern var ctxlen : Null<Int>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_blank_lines: boolean?
		```
		
		---
		
		Ignore blank lines
	**/
	extern var ignore_blank_lines : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_cr_at_eol: boolean?
		```
		
		---
		
		Ignore carriage return at end-of-line
	**/
	extern var ignore_cr_at_eol : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_whitespace: boolean?
		```
		
		---
		
		Ignore whitespace
	**/
	extern var ignore_whitespace : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_whitespace_change: boolean?
		```
		
		---
		
		Ignore whitespace change
	**/
	extern var ignore_whitespace_change : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.ignore_whitespace_change_at_eol: boolean?
		```
		
		---
		
		Ignore whitespace change at end-of-line.
	**/
	extern var ignore_whitespace_change_at_eol : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.indent_heuristic: boolean?
		```
		
		---
		
		Use the indent heuristic for the internal diff library.
	**/
	extern var indent_heuristic : Null<Bool>;
	/**
		```lua
		(field) vim.diff.Opts.interhunkctxlen: integer?
		```
		
		---
		
		Inter hunk context length
	**/
	extern var interhunkctxlen : Null<Int>;
	/**
		```lua
		(field) vim.diff.Opts.linematch: (boolean|integer)?
		```
		
		---
		
		
		 Run linematch on the resulting hunks from xdiff. When integer, only hunks
		 upto this size in lines are run through linematch.
		 Requires `result_type = indices`, ignored otherwise.
	**/
	extern var linematch : Null<haxe.extern.EitherType<Bool, Int>>;
	/**
		```lua
		(field) vim.diff.Opts.on_hunk: fun(start_a: integer, count_a: integer, start_b: integer, count_b: integer):integer??
		```
		
		---
		
		 @inlinedoc
		
		 Invoked for each hunk in the diff. Return a negative number
		 to cancel the callback for any remaining hunks.
		 Arguments:
		   - `start_a` (`integer`): Start line of hunk in {a}.
		   - `count_a` (`integer`): Hunk size in {a}.
		   - `start_b` (`integer`): Start line of hunk in {b}.
		   - `count_b` (`integer`): Hunk size in {b}.
		
		---
		
		```lua
		function (start_a: integer, count_a: integer, start_b: integer, count_b: integer)
		  -> integer?
		```
	**/
	extern var on_hunk : Null<(start_a:Int, count_a:Int, start_b:Int, count_b:Int) -> Null<Int>>;
	/**
		```lua
		(field) vim.diff.Opts.result_type: ('indices'|'unified')?
		```
		
		---
		
		
		 Form of the returned diff:
		   - `unified`: String in unified format.
		   - `indices`: Array of hunk locations.
		 Note: This option is ignored if `on_hunk` is used.
		 (default: `'unified'`)
	**/
	extern var result_type : Null<String>;
}