package nvim.type.lsp;

/**
	```lua
	(class) lsp.ReferenceOptions
	```
	
	---
	
	Reference options.
**/
@:structInit class ReferenceOptions {
	/**
		```lua
		(field) lsp.ReferenceOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	var workDoneProgress : Null<Bool>;
}