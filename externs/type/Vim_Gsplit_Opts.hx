package externs.type;

/**
	```lua
	(class) vim.gsplit.Opts
	```
**/
@:native("vim.gsplit.Opts") extern class Vim_Gsplit_Opts {
	/**
		```lua
		(field) vim.gsplit.Opts.plain: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Use `sep` literally (as in string.find).
	**/
	extern var plain : Null<Bool>;
	/**
		```lua
		(field) vim.gsplit.Opts.trimempty: boolean?
		```
		
		---
		
		
		 Discard empty segments at start and end of the sequence.
	**/
	extern var trimempty : Null<Bool>;
}