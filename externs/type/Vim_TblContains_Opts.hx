package externs.type;

/**
	```lua
	(class) vim.tbl_contains.Opts
	```
**/
@:native("vim.tbl_contains.Opts") extern class Vim_TblContains_Opts {
	/**
		```lua
		(field) vim.tbl_contains.Opts.predicate: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 `value` is a function reference to be checked (default false)
	**/
	extern var predicate : Null<Bool>;
}