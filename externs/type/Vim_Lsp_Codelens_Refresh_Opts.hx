package externs.type;

/**
	```lua
	(class) vim.lsp.codelens.refresh.Opts
	```
**/
@:structInit extern class Vim_Lsp_Codelens_Refresh_Opts {
	/**
		```lua
		(field) vim.lsp.codelens.refresh.Opts.bufnr: integer?
		```
		
		---
		
		filter by buffer. All buffers if nil, 0 for current buffer
	**/
	extern var bufnr : Null<Int>;
}