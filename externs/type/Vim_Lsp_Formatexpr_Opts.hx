package externs.type;

/**
	```lua
	(class) vim.lsp.formatexpr.Opts
	```
**/
@:structInit extern class Vim_Lsp_Formatexpr_Opts {
	/**
		```lua
		(field) vim.lsp.formatexpr.Opts.timeout_ms: integer
		```
		
		---
		
		 @inlinedoc
		
		 The timeout period for the formatting request.
		 (default: 500ms).
	**/
	extern var timeout_ms : Int;
}