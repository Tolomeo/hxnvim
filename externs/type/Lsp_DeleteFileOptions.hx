package externs.type;

/**
	```lua
	(class) lsp.DeleteFileOptions
	```
	
	---
	
	Delete file options
**/
@:native("lsp.DeleteFileOptions") extern class Lsp_DeleteFileOptions {
	/**
		```lua
		(field) lsp.DeleteFileOptions.ignoreIfNotExists: boolean?
		```
		
		---
		
		
		Ignore the operation if the file doesn't exist.
	**/
	extern var ignoreIfNotExists : Null<Bool>;
	/**
		```lua
		(field) lsp.DeleteFileOptions.recursive: boolean?
		```
		
		---
		
		
		Delete the content recursively if a folder is denoted.
	**/
	extern var recursive : Null<Bool>;
}