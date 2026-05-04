package externs.type;

/**
	```lua
	(class) lsp.SemanticTokensOptions
	```
**/
extern class Lsp_SemanticTokensOptions {
	/**
		```lua
		(field) lsp.SemanticTokensOptions.full: (boolean|lsp.SemanticTokensFullDelta)?
		```
		
		---
		
		Semantic tokens options to support deltas for full documents
		
		
		---
		
		
		Server supports providing semantic tokens for a full document.
	**/
	extern var full : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_SemanticTokensFullDelta>>;
	/**
		```lua
		(field) lsp.SemanticTokensOptions.legend: lsp.SemanticTokensLegend
		```
		
		---
		
		
		The legend used by the server
	**/
	extern var legend : externs.type.Lsp_SemanticTokensLegend;
	/**
		```lua
		(field) lsp.SemanticTokensOptions.range: (boolean|lsp._anonym1.range)?
		```
		
		---
		
		
		Server supports providing semantic tokens for a specific range
		of a document.
	**/
	extern var range : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_Anonym1_Range>>;
	/**
		```lua
		(field) lsp.SemanticTokensOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}