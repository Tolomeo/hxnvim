package externs.type;

/**
	```lua
	(class) lsp.DocumentHighlightOptions
	```
	
	---
	
	Provider options for a {@link DocumentHighlightRequest}.
**/
@:native("lsp.DocumentHighlightOptions") extern class Lsp_DocumentHighlightOptions {
	/**
		```lua
		(field) lsp.DocumentHighlightOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}