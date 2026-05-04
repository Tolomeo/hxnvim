package externs.type;

/**
	```lua
	(class) lsp.ClientSymbolResolveOptions
	```
**/
extern class Lsp_ClientSymbolResolveOptions {
	/**
		```lua
		(field) lsp.ClientSymbolResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily. Usually
		`location.range`
	**/
	extern var properties : Array<String>;
}