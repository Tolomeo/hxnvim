package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentHighlightOptions
	```
	
	---
	
	Provider options for a {@link DocumentHighlightRequest}.
**/
@:structInit class DocumentHighlightOptions {
	/**
		```lua
		(field) lsp.DocumentHighlightOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}