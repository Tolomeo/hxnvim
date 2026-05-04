package externs.type;

/**
	```lua
	(class) lsp.ClientInlayHintResolveOptions
	```
**/
extern class Lsp_ClientInlayHintResolveOptions {
	/**
		```lua
		(field) lsp.ClientInlayHintResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	extern var properties : Array<String>;
}