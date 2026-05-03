package externs.type;

/**
	```lua
	(class) lsp.DocumentLinkClientCapabilities
	```
	
	---
	
	The client capabilities of a {@link DocumentLinkRequest}.
**/
@:native("lsp.DocumentLinkClientCapabilities") extern class Lsp_DocumentLinkClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentLinkClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether document link supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentLinkClientCapabilities.tooltipSupport: boolean?
		```
		
		---
		
		
		Whether the client supports the `tooltip` property on `DocumentLink`.
		
	**/
	extern var tooltipSupport : Null<Bool>;
}