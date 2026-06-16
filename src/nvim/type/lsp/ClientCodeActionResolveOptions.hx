package nvim.type.lsp;

/**
	```lua
	(class) lsp.ClientCodeActionResolveOptions
	```
**/
@:structInit class ClientCodeActionResolveOptions {
	/**
		```lua
		(field) lsp.ClientCodeActionResolveOptions.properties: string[]
		```
		
		---
		
		
		The properties that a client can resolve lazily.
	**/
	var properties : Array<String>;
}