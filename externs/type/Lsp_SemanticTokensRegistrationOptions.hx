package externs.type;

/**
	```lua
	(class) lsp.SemanticTokensRegistrationOptions
	```
**/
@:structInit extern class Lsp_SemanticTokensRegistrationOptions {
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.documentSelector: lsp.NotebookCellTextDocumentFilter|lsp.TextDocumentFilterLanguage|lsp.TextDocumentFilterPattern|lsp.TextDocumentFilterScheme[]|nil
		```
		
		---
		
		A document selector is the combination of one or many document filters.
		
		\@sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language: 'json', pattern: '**∕tsconfig.json' }]`;
		
		The use of a string as a document filter is deprecated @since 3.16.0.
		
		---
		
		
		A document selector to identify the scope of the registration. If set to null
		the document selector provided on the client side will be used.
	**/
	extern var documentSelector : haxe.extern.EitherType<externs.type.Lsp_DocumentSelector, externs.type.Lsp_Null>;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.full: (boolean|lsp.SemanticTokensFullDelta)?
		```
		
		---
		
		Semantic tokens options to support deltas for full documents
		
		
		---
		
		
		Server supports providing semantic tokens for a full document.
	**/
	extern var full : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_SemanticTokensFullDelta>>;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	extern var id : Null<String>;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.legend: lsp.SemanticTokensLegend
		```
		
		---
		
		
		The legend used by the server
	**/
	extern var legend : externs.type.Lsp_SemanticTokensLegend;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.range: (boolean|lsp._anonym1.range)?
		```
		
		---
		
		
		Server supports providing semantic tokens for a specific range
		of a document.
	**/
	extern var range : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_Anonym1_Range>>;
	/**
		```lua
		(field) lsp.SemanticTokensRegistrationOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}