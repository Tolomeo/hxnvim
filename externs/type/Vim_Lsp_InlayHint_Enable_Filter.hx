package externs.type;

/**
	```lua
	(class) vim.lsp.inlay_hint.enable.Filter
	```
	
	---
	
	 Optional filters |kwargs|, or `nil` for all.
**/
extern class Vim_Lsp_InlayHint_Enable_Filter {
	/**
		```lua
		(field) vim.lsp.inlay_hint.enable.Filter.bufnr: integer?
		```
		
		---
		
		 @inlinedoc
		 Buffer number, or 0 for current buffer, or nil for all.
	**/
	extern var bufnr : Null<Int>;
}