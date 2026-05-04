package externs.type;

/**
	```lua
	(class) lsp.FileOperationRegistrationOptions
	```
	
	---
	
	The options to register for file operations.
	
**/
@:structInit extern class Lsp_FileOperationRegistrationOptions {
	/**
		```lua
		(field) lsp.FileOperationRegistrationOptions.filters: lsp.FileOperationFilter[]
		```
		
		---
		
		
		The actual filters.
	**/
	extern var filters : Array<externs.type.Lsp_FileOperationFilter>;
}