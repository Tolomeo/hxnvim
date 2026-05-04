package externs.type;

/**
	```lua
	(class) lsp.DefinitionClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link DefinitionRequest}.
**/
@:structInit extern class Lsp_DefinitionClientCapabilities {
	/**
		```lua
		(field) lsp.DefinitionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether definition supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DefinitionClientCapabilities.linkSupport: boolean?
		```
		
		---
		
		
		The client supports additional metadata in the form of definition links.
		
	**/
	extern var linkSupport : Null<Bool>;
}