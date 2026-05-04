package externs.type;

/**
	```lua
	(class) lsp.DidChangeConfigurationClientCapabilities
	```
**/
@:structInit extern class Lsp_DidChangeConfigurationClientCapabilities {
	/**
		```lua
		(field) lsp.DidChangeConfigurationClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Did change configuration notification supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
}