package externs.type;

/**
	```lua
	(class) lsp.HoverOptions
	```
	
	---
	
	Hover options.
**/
@:native("lsp.HoverOptions") extern class Lsp_HoverOptions {
	/**
		```lua
		(field) lsp.HoverOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}