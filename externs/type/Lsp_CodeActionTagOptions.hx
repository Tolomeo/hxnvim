package externs.type;

/**
	```lua
	(class) lsp.CodeActionTagOptions
	```
**/
@:native("lsp.CodeActionTagOptions") extern class Lsp_CodeActionTagOptions {
	/**
		```lua
		(field) lsp.CodeActionTagOptions.valueSet: 1[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern var valueSet : Array<externs.type.Lsp_CodeActionTag>;
}