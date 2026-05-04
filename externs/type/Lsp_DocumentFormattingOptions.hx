package externs.type;

/**
	```lua
	(class) lsp.DocumentFormattingOptions
	```
	
	---
	
	Provider options for a {@link DocumentFormattingRequest}.
**/
@:structInit extern class Lsp_DocumentFormattingOptions {
	/**
		```lua
		(field) lsp.DocumentFormattingOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}