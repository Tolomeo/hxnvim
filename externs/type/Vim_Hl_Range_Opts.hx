package externs.type;

/**
	```lua
	(class) vim.hl.range.Opts
	```
**/
@:native("vim.hl.range.Opts") extern class Vim_Hl_Range_Opts {
	/**
		```lua
		(field) vim.hl.range.Opts.inclusive: boolean?
		```
		
		---
		
		
		 Indicates whether the range is end-inclusive
		 (default: `false`)
	**/
	extern var inclusive : Null<Bool>;
	/**
		```lua
		(field) vim.hl.range.Opts.priority: integer?
		```
		
		---
		
		
		 Highlight priority
		 (default: `vim.hl.priorities.user`)
	**/
	extern var priority : Null<Int>;
	/**
		```lua
		(field) vim.hl.range.Opts.regtype: string?
		```
		
		---
		
		 @inlinedoc
		
		 Type of range. See [getregtype()]
		 (default: `'v'` i.e. charwise)
	**/
	extern var regtype : Null<String>;
	/**
		```lua
		(field) vim.hl.range.Opts.timeout: integer?
		```
		
		---
		
		
		 Time in ms before highlight is cleared
		 (default: -1 no timeout)
	**/
	extern var timeout : Null<Int>;
}