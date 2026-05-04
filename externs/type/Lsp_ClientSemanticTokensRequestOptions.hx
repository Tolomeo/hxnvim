package externs.type;

/**
	```lua
	(class) lsp.ClientSemanticTokensRequestOptions
	```
**/
extern class Lsp_ClientSemanticTokensRequestOptions {
	/**
		```lua
		(field) lsp.ClientSemanticTokensRequestOptions.full: (boolean|lsp.ClientSemanticTokensRequestFullDelta)?
		```
		
		---
		
		
		The client will send the `textDocument/semanticTokens/full` request if
		the server provides a corresponding handler.
	**/
	extern var full : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_ClientSemanticTokensRequestFullDelta>>;
	/**
		```lua
		(field) lsp.ClientSemanticTokensRequestOptions.range: (boolean|lsp._anonym2.range)?
		```
		
		---
		
		
		The client will send the `textDocument/semanticTokens/range` request if
		the server provides a corresponding handler.
	**/
	extern var range : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_Anonym2_Range>>;
}