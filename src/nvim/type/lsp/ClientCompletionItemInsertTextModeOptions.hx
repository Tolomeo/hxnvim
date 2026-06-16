package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCompletionItemInsertTextModeOptions
	```
**/
@:structInit class ClientCompletionItemInsertTextModeOptions {
	/**
		```lua
		(field) lsp.ClientCompletionItemInsertTextModeOptions.valueSet: 1|2[]
		```
	**/
	var valueSet : Array<nvim.type.lsp.InsertTextMode>;
}