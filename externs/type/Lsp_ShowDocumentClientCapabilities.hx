package externs.type;

/**
	```lua
	(class) lsp.ShowDocumentClientCapabilities
	```
	
	---
	
	Client capabilities for the showDocument request.
	
**/
@:structInit extern class Lsp_ShowDocumentClientCapabilities {
	/**
		```lua
		(field) lsp.ShowDocumentClientCapabilities.support: boolean
		```
		
		---
		
		
		The client has support for the showDocument
		request.
	**/
	extern var support : Bool;
}