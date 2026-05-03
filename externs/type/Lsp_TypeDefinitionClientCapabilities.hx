package externs.type;

/**
	```lua
	(class) lsp.TypeDefinitionClientCapabilities
	```
	
	---
	
	Since 3.6.0
**/
@:native("lsp.TypeDefinitionClientCapabilities") extern class Lsp_TypeDefinitionClientCapabilities {
	/**
		```lua
		(field) lsp.TypeDefinitionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `TypeDefinitionRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.TypeDefinitionClientCapabilities.linkSupport: boolean?
		```
		
		---
		
		
		The client supports additional metadata in the form of definition links.
		
		Since 3.14.0
	**/
	extern var linkSupport : Null<Bool>;
}