package nvim.type.vim.lsp.util.rename;

/**
	```lua
	(class) vim.lsp.util.rename.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.lsp.util.rename.Opts.ignoreIfExists: boolean?
		```
	**/
	@:optional
	var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.util.rename.Opts.overwrite: boolean?
		```
		
		---
		
		 @inlinedoc
	**/
	@:optional
	var overwrite : Null<Bool>;
}