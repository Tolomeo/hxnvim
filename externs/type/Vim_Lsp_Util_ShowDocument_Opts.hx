package externs.type;

/**
	```lua
	(class) vim.lsp.util.show_document.Opts
	```
**/
@:native("vim.lsp.util.show_document.Opts") extern class Vim_Lsp_Util_ShowDocument_Opts {
	/**
		```lua
		(field) vim.lsp.util.show_document.Opts.focus: boolean?
		```
		
		---
		
		
		 Whether to focus/jump to location if possible.
		 (defaults: true)
	**/
	extern var focus : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.util.show_document.Opts.reuse_win: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Jump to existing window if buffer is already open.
	**/
	extern var reuse_win : Null<Bool>;
}