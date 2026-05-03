package externs.type;

/**
	```lua
	(class) lsp.RenameFileOptions
	```
	
	---
	
	Rename file options
**/
@:native("lsp.RenameFileOptions") extern class Lsp_RenameFileOptions {
	/**
		```lua
		(field) lsp.RenameFileOptions.ignoreIfExists: boolean?
		```
		
		---
		
		
		Ignores if target exists.
	**/
	extern var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameFileOptions.overwrite: boolean?
		```
		
		---
		
		
		Overwrite target if existing. Overwrite wins over `ignoreIfExists`
	**/
	extern var overwrite : Null<Bool>;
}