package externs.type;

/**
	```lua
	(class) lsp.ClientSemanticTokensRequestFullDelta
	```
**/
@:structInit extern class Lsp_ClientSemanticTokensRequestFullDelta {
	/**
		```lua
		(field) lsp.ClientSemanticTokensRequestFullDelta.delta: boolean?
		```
		
		---
		
		
		The client will send the `textDocument/semanticTokens/full/delta` request if
		the server provides a corresponding handler.
	**/
	extern var delta : Null<Bool>;
}