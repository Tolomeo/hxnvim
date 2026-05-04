package externs.type;

/**
	```lua
	(class) lsp.CodeDescription
	```
	
	---
	
	Structure to capture a description for an error code.
	
**/
@:structInit extern class Lsp_CodeDescription {
	/**
		```lua
		(field) lsp.CodeDescription.href: string
		```
		
		---
		
		
		An URI to open with more information about the diagnostic error.
	**/
	extern var href : externs.type.Lsp_URI;
}