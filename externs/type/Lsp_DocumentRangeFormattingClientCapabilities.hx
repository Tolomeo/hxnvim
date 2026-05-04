package externs.type;

/**
	```lua
	(class) lsp.DocumentRangeFormattingClientCapabilities
	```
	
	---
	
	Client capabilities of a {@link DocumentRangeFormattingRequest}.
**/
extern class Lsp_DocumentRangeFormattingClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentRangeFormattingClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether range formatting supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentRangeFormattingClientCapabilities.rangesSupport: boolean?
		```
		
		---
		
		
		Whether the client supports formatting multiple ranges at once.
		
	**/
	extern var rangesSupport : Null<Bool>;
}