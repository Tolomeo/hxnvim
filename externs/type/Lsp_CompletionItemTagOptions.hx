package externs.type;

/**
	```lua
	(class) lsp.CompletionItemTagOptions
	```
**/
@:structInit extern class Lsp_CompletionItemTagOptions {
	/**
		```lua
		(field) lsp.CompletionItemTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern var valueSet : Array<externs.type.Lsp_CompletionItemTag>;
}