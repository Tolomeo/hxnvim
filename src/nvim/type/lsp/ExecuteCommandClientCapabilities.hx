package nvim.type.lsp;

/**
	```lua
	(class) lsp.ExecuteCommandClientCapabilities
	```
	
	---
	
	The client capabilities of a {@link ExecuteCommandRequest}.
**/
@:structInit class ExecuteCommandClientCapabilities {
	/**
		```lua
		(field) lsp.ExecuteCommandClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Execute command supports dynamic registration.
	**/
	@:optional
	var dynamicRegistration : Null<Bool>;
}