package externs.type;

/**
	```lua
	(class) lsp.CompletionItemTagOptions
	```
**/
@:native("lsp.CompletionItemTagOptions") extern class Lsp_CompletionItemTagOptions {
	/**
		```lua
		(field) lsp.CompletionItemTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern var valueSet : Array<externs.type.Lsp_CompletionItemTag>;
}