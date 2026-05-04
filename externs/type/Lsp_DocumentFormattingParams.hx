package externs.type;

/**
	```lua
	(class) lsp.DocumentFormattingParams
	```
	
	---
	
	The parameters of a {@link DocumentFormattingRequest}.
**/
@:structInit extern class Lsp_DocumentFormattingParams {
	/**
		```lua
		(field) lsp.DocumentFormattingParams.options: lsp.FormattingOptions
		```
		
		---
		
		Value-object describing what options formatting should use.
		
		---
		
		
		The format options.
	**/
	extern var options : externs.type.Lsp_FormattingOptions;
	/**
		```lua
		(field) lsp.DocumentFormattingParams.textDocument: lsp.TextDocumentIdentifier
		```
		
		---
		
		A literal to identify a text document in the client.
		
		---
		
		
		The document to format.
	**/
	extern var textDocument : externs.type.Lsp_TextDocumentIdentifier;
	/**
		```lua
		(field) lsp.DocumentFormattingParams.workDoneToken: (string|integer)?
		```
		
		---
		
		
		An optional token that a server can use to report work done progress.
	**/
	extern var workDoneToken : Null<externs.type.Lsp_ProgressToken>;
}