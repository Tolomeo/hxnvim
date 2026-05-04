package externs.type;

/**
	```lua
	(class) lsp.DeclarationClientCapabilities
	```
**/
extern class Lsp_DeclarationClientCapabilities {
	/**
		```lua
		(field) lsp.DeclarationClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether declaration supports dynamic registration. If this is set to `true`
		the client supports the new `DeclarationRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DeclarationClientCapabilities.linkSupport: boolean?
		```
		
		---
		
		
		The client supports additional metadata in the form of declaration links.
	**/
	extern var linkSupport : Null<Bool>;
}