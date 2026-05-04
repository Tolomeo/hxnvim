package externs.type;

/**
	```lua
	(class) lsp.InlineValueClientCapabilities
	```
	
	---
	
	Client capabilities specific to inline values.
	
**/
@:structInit extern class Lsp_InlineValueClientCapabilities {
	/**
		```lua
		(field) lsp.InlineValueClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration for inline value providers.
	**/
	extern var dynamicRegistration : Null<Bool>;
}