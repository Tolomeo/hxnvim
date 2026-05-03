package externs.type;

/**
	```lua
	(class) lsp.SaveOptions
	```
	
	---
	
	Save options.
**/
@:native("lsp.SaveOptions") extern class Lsp_SaveOptions {
	/**
		```lua
		(field) lsp.SaveOptions.includeText: boolean?
		```
		
		---
		
		
		The client is supposed to include the content on save.
	**/
	extern var includeText : Null<Bool>;
}