package externs.type;

/**
	```lua
	(class) lsp.SemanticTokensLegend
	```
**/
@:native("lsp.SemanticTokensLegend") extern class Lsp_SemanticTokensLegend {
	/**
		```lua
		(field) lsp.SemanticTokensLegend.tokenModifiers: string[]
		```
		
		---
		
		
		The token modifiers a server uses.
	**/
	extern var tokenModifiers : Array<String>;
	/**
		```lua
		(field) lsp.SemanticTokensLegend.tokenTypes: string[]
		```
		
		---
		
		
		The token types a server uses.
	**/
	extern var tokenTypes : Array<String>;
}