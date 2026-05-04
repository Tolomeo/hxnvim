package externs.type;

/**
	```lua
	(class) lsp.TextDocumentContentOptions
	```
	
	---
	
	Text document content provider options.
	
**/
@:structInit extern class Lsp_TextDocumentContentOptions {
	/**
		```lua
		(field) lsp.TextDocumentContentOptions.schemes: string[]
		```
		
		---
		
		
		The schemes for which the server provides content.
	**/
	extern var schemes : Array<String>;
}