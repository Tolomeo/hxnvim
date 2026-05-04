package externs.type;

/**
	```lua
	(class) lsp.ClientCodeActionResolveOptions
	```
**/
@:structInit extern class Lsp_ClientCodeActionResolveOptions {
	/**
		```lua
		(field) lsp.ClientCodeActionResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	extern var properties : Array<String>;
}