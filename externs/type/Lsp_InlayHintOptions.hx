package externs.type;

/**
	```lua
	(class) lsp.InlayHintOptions
	```
	
	---
	
	Inlay hint options used during static registration.
	
**/
extern class Lsp_InlayHintOptions {
	/**
		```lua
		(field) lsp.InlayHintOptions.resolveProvider: boolean?
		```
		
		---
		
		
		The server provides support to resolve additional
		information for an inlay hint item.
	**/
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.InlayHintOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}