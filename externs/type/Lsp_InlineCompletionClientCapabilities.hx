package externs.type;

/**
	```lua
	(class) lsp.InlineCompletionClientCapabilities
	```
	
	---
	
	Client capabilities specific to inline completions.
	
**/
@:structInit extern class Lsp_InlineCompletionClientCapabilities {
	/**
		```lua
		(field) lsp.InlineCompletionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration for inline completion providers.
	**/
	extern var dynamicRegistration : Null<Bool>;
}