package externs.type;

/**
	```lua
	(class) lsp.DocumentColorClientCapabilities
	```
**/
@:native("lsp.DocumentColorClientCapabilities") extern class Lsp_DocumentColorClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentColorClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `DocumentColorRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
}