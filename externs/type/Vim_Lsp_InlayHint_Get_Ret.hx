package externs.type;

/**
	```lua
	(class) vim.lsp.inlay_hint.get.ret
	```
**/
extern class Vim_Lsp_InlayHint_Get_Ret {
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.bufnr: integer
		```
		
		---
		
		 @inlinedoc
	**/
	extern var bufnr : Int;
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.client_id: integer
		```
	**/
	extern var client_id : Int;
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.inlay_hint: lsp.InlayHint
		```
		
		---
		
		Inlay hint information.
		
	**/
	extern var inlay_hint : externs.type.Lsp_InlayHint;
}