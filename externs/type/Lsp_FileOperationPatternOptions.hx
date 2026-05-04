package externs.type;

/**
	```lua
	(class) lsp.FileOperationPatternOptions
	```
	
	---
	
	Matching options for the file operation pattern.
	
**/
@:structInit extern class Lsp_FileOperationPatternOptions {
	/**
		```lua
		(field) lsp.FileOperationPatternOptions.ignoreCase: boolean?
		```
		
		---
		
		
		The pattern should be matched ignoring casing.
	**/
	extern var ignoreCase : Null<Bool>;
}