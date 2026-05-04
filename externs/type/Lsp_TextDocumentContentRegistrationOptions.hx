package externs.type;

/**
	```lua
	(class) lsp.TextDocumentContentRegistrationOptions
	```
	
	---
	
	Text document content provider registration options.
	
**/
extern class Lsp_TextDocumentContentRegistrationOptions {
	/**
		```lua
		(field) lsp.TextDocumentContentRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	extern var id : Null<String>;
	/**
		```lua
		(field) lsp.TextDocumentContentRegistrationOptions.schemes: string[]
		```
		
		---
		
		
		The schemes for which the server provides content.
	**/
	extern var schemes : Array<String>;
}