package externs.type;

/**
	```lua
	(class) lsp.DocumentRangeFormattingOptions
	```
	
	---
	
	Provider options for a {@link DocumentRangeFormattingRequest}.
**/
@:native("lsp.DocumentRangeFormattingOptions") extern class Lsp_DocumentRangeFormattingOptions {
	/**
		```lua
		(field) lsp.DocumentRangeFormattingOptions.rangesSupport: boolean?
		```
		
		---
		
		
		Whether the server supports formatting multiple ranges at once.
		
	**/
	extern var rangesSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentRangeFormattingOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}