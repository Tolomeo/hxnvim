package externs.type;

/**
	```lua
	(class) lsp.DocumentHighlightClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link DocumentHighlightRequest}.
**/
@:structInit extern class Lsp_DocumentHighlightClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentHighlightClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether document highlight supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
}