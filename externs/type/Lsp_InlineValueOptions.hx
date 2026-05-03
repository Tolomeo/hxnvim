package externs.type;

/**
	```lua
	(class) lsp.InlineValueOptions
	```
	
	---
	
	Inline value options used during static registration.
	
**/
@:native("lsp.InlineValueOptions") extern class Lsp_InlineValueOptions {
	/**
		```lua
		(field) lsp.InlineValueOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}