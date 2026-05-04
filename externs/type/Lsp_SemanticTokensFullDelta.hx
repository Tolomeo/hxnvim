package externs.type;

/**
	```lua
	(class) lsp.SemanticTokensFullDelta
	```
	
	---
	
	Semantic tokens options to support deltas for full documents
	
**/
@:structInit extern class Lsp_SemanticTokensFullDelta {
	/**
		```lua
		(field) lsp.SemanticTokensFullDelta.delta: boolean?
		```
		
		---
		
		
		The server supports deltas for full documents.
	**/
	extern var delta : Null<Bool>;
}