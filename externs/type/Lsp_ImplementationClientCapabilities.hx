package externs.type;

/**
	```lua
	(class) lsp.ImplementationClientCapabilities
	```
**/
@:native("lsp.ImplementationClientCapabilities") extern class Lsp_ImplementationClientCapabilities {
	/**
		```lua
		(field) lsp.ImplementationClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `ImplementationRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.ImplementationClientCapabilities.linkSupport: boolean?
		```
		
		---
		
		
		The client supports additional metadata in the form of definition links.
		
	**/
	extern var linkSupport : Null<Bool>;
}