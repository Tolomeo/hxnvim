package externs.type;

/**
	```lua
	(class) lsp.ClientCompletionItemInsertTextModeOptions
	```
**/
@:structInit extern class Lsp_ClientCompletionItemInsertTextModeOptions {
	/**
		```lua
		(field) lsp.ClientCompletionItemInsertTextModeOptions.valueSet: 1|2[]
		```
	**/
	extern var valueSet : Array<externs.type.Lsp_InsertTextMode>;
}