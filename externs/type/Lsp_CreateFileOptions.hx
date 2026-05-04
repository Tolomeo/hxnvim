package externs.type;

/**
	```lua
	(class) lsp.CreateFileOptions
	```
	
	---
	
	Options to create a file.
**/
@:structInit extern class Lsp_CreateFileOptions {
	/**
		```lua
		(field) lsp.CreateFileOptions.ignoreIfExists: boolean?
		```
		
		---
		
		
		Ignore if exists.
	**/
	extern var ignoreIfExists : Null<Bool>;
	/**
		```lua
		(field) lsp.CreateFileOptions.overwrite: boolean?
		```
		
		---
		
		
		Overwrite existing file. Overwrite wins over `ignoreIfExists`
	**/
	extern var overwrite : Null<Bool>;
}