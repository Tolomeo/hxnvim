package externs.type;

/**
	```lua
	(class) vim.lsp.semantic_tokens.highlight_token.Opts
	```
**/
@:native("vim.lsp.semantic_tokens.highlight_token.Opts") extern class Vim_Lsp_SemanticTokens_HighlightToken_Opts {
	/**
		```lua
		(field) vim.lsp.semantic_tokens.highlight_token.Opts.priority: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Priority for the applied extmark.
		 (Default: `vim.hl.priorities.semantic_tokens + 3`)
	**/
	extern var priority : Null<Int>;
}