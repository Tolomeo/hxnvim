package nvim.type.lsp;

/**
	```lua
	(class) lsp.SemanticTokensLegend
	```
**/
@:structInit class SemanticTokensLegend {
	/**
		```lua
		(field) lsp.SemanticTokensLegend.tokenModifiers: string[]
		```
		
		---
		
		
		The token modifiers a server uses.
	**/
	extern var tokenModifiers : lua.Table<Int, String>;
	/**
		```lua
		(field) lsp.SemanticTokensLegend.tokenTypes: string[]
		```
		
		---
		
		
		The token types a server uses.
	**/
	extern var tokenTypes : lua.Table<Int, String>;
}