package externs.type;

/**
	```lua
	(class) lsp.DocumentOnTypeFormattingClientCapabilities
	```
	
	---
	
	Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
**/
@:native("lsp.DocumentOnTypeFormattingClientCapabilities") extern class Lsp_DocumentOnTypeFormattingClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentOnTypeFormattingClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether on type formatting supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
}