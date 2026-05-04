package externs.type;

/**
	```lua
	(class) lsp.ClientSymbolTagOptions
	```
**/
@:structInit extern class Lsp_ClientSymbolTagOptions {
	/**
		```lua
		(field) lsp.ClientSymbolTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern var valueSet : Array<externs.type.Lsp_SymbolTag>;
}