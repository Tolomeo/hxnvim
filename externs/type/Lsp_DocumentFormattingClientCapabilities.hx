package externs.type;

/**
	```lua
	(class) lsp.DocumentFormattingClientCapabilities
	```
	
	---
	
	Client capabilities of a {@link DocumentFormattingRequest}.
**/
@:native("lsp.DocumentFormattingClientCapabilities") extern class Lsp_DocumentFormattingClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentFormattingClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether formatting supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
}