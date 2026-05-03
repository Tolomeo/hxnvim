package externs.type;

/**
	```lua
	(class) lsp.TextDocumentIdentifier
	```
	
	---
	
	A literal to identify a text document in the client.
**/
@:native("lsp.TextDocumentIdentifier") extern class Lsp_TextDocumentIdentifier {
	/**
		```lua
		(field) lsp.TextDocumentIdentifier.uri: string
		```
		
		---
		
		
		The text document's uri.
	**/
	extern var uri : externs.type.Lsp_DocumentUri;
}