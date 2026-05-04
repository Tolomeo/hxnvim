package externs.type;

/**
	```lua
	(class) lsp.ClientCodeLensResolveOptions
	```
**/
extern class Lsp_ClientCodeLensResolveOptions {
	/**
		```lua
		(field) lsp.ClientCodeLensResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	extern var properties : Array<String>;
}