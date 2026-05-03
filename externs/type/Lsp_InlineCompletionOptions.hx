package externs.type;

/**
	```lua
	(class) lsp.InlineCompletionOptions
	```
	
	---
	
	Inline completion options used during static registration.
	
**/
@:native("lsp.InlineCompletionOptions") extern class Lsp_InlineCompletionOptions {
	/**
		```lua
		(field) lsp.InlineCompletionOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}