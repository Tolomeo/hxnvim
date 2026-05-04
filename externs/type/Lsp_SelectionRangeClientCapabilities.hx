package externs.type;

/**
	```lua
	(class) lsp.SelectionRangeClientCapabilities
	```
**/
extern class Lsp_SelectionRangeClientCapabilities {
	/**
		```lua
		(field) lsp.SelectionRangeClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration for selection range providers. If this is set to `true`
		the client supports the new `SelectionRangeRegistrationOptions` return value for the corresponding server
		capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
}