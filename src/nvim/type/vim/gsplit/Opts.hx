package nvim.type.vim.gsplit;

/**
	```lua
	(class) vim.gsplit.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.gsplit.Opts.plain: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Use `sep` literally (as in string.find).
	**/
	@:optional
	var plain : Null<Bool>;
	/**
		```lua
		(field) vim.gsplit.Opts.trimempty: boolean?
		```
		
		---
		
		
		 Discard empty segments at start and end of the sequence.
	**/
	@:optional
	var trimempty : Null<Bool>;
}