package externs.type;

/**
	```lua
	(class) lsp.ReferenceClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link ReferencesRequest}.
**/
@:structInit extern class Lsp_ReferenceClientCapabilities {
	/**
		```lua
		(field) lsp.ReferenceClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether references supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
}