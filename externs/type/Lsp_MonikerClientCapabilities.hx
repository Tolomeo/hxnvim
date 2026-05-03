package externs.type;

/**
	```lua
	(class) lsp.MonikerClientCapabilities
	```
	
	---
	
	Client capabilities specific to the moniker request.
	
**/
@:native("lsp.MonikerClientCapabilities") extern class Lsp_MonikerClientCapabilities {
	/**
		```lua
		(field) lsp.MonikerClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether moniker supports dynamic registration. If this is set to `true`
		the client supports the new `MonikerRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
}