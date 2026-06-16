package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentRangeFormattingClientCapabilities
	```
	
	---
	
	Client capabilities of a {@link DocumentRangeFormattingRequest}.
**/
@:structInit class DocumentRangeFormattingClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentRangeFormattingClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether range formatting supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentRangeFormattingClientCapabilities.rangesSupport: boolean?
		```
		
		---
		
		
		Whether the client supports formatting multiple ranges at once.
		
	**/
	var rangesSupport : Null<Bool>;
}