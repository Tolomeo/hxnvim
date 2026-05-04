package externs.type;

/**
	```lua
	(class) lsp.TextDocumentEdit
	```
	
	---
	
	Describes textual changes on a text document. A TextDocumentEdit describes all changes
	on a document version Si and after they are applied move the document to version Si+1.
	So the creator of a TextDocumentEdit doesn't need to sort the array of edits or do any
	kind of ordering. However the edits must be non overlapping.
**/
@:structInit extern class Lsp_TextDocumentEdit {
	/**
		```lua
		(field) lsp.TextDocumentEdit.edits: (lsp.AnnotatedTextEdit|lsp.SnippetTextEdit|lsp.TextEdit)[]
		```
		
		---
		
		
		The edits to be applied.
		
		client capability.
		
		client capability.
	**/
	extern var edits : Array<haxe.extern.EitherType<externs.type.Lsp_TextEdit, haxe.extern.EitherType<externs.type.Lsp_AnnotatedTextEdit, externs.type.Lsp_SnippetTextEdit>>>;
	/**
		```lua
		(field) lsp.TextDocumentEdit.textDocument: lsp.OptionalVersionedTextDocumentIdentifier
		```
		
		---
		
		A text document identifier to optionally denote a specific version of a text document.
		
		---
		
		
		The text document to change.
	**/
	extern var textDocument : externs.type.Lsp_OptionalVersionedTextDocumentIdentifier;
}