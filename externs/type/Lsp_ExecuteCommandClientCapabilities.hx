package externs.type;

/**
	```lua
	(class) lsp.ExecuteCommandClientCapabilities
	```
	
	---
	
	The client capabilities of a {@link ExecuteCommandRequest}.
**/
@:structInit extern class Lsp_ExecuteCommandClientCapabilities {
	/**
		```lua
		(field) lsp.ExecuteCommandClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Execute command supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
}