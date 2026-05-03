package externs.type;

/**
	```lua
	(class) vim.lsp.util.rename.Opts
	```
**/
@:native("vim.lsp.util.rename.Opts") extern class Vim_Lsp_Util_Rename_Opts {
	/**
		```lua
		(field) vim.lsp.util.rename.Opts.ignoreIfExists: boolean?
		```
	**/
	extern var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.util.rename.Opts.overwrite: boolean?
		```
		
		---
		
		 @inlinedoc
	**/
	extern var overwrite : Null<Bool>;
}