package externs.type;

/**
	```lua
	(class) lsp.ClientCompletionItemResolveOptions
	```
**/
@:structInit extern class Lsp_ClientCompletionItemResolveOptions {
	/**
		```lua
		(field) lsp.ClientCompletionItemResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	extern var properties : Array<String>;
}