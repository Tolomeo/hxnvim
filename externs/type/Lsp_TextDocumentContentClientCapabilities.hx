package externs.type;

/**
	```lua
	(class) lsp.TextDocumentContentClientCapabilities
	```
	
	---
	
	Client capabilities for a text document content provider.
	
**/
@:native("lsp.TextDocumentContentClientCapabilities") extern class Lsp_TextDocumentContentClientCapabilities {
	/**
		```lua
		(field) lsp.TextDocumentContentClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Text document content provider supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
}