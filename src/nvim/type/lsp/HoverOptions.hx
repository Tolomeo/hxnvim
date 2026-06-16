package nvim.type.lsp;

/**
	```lua
	(class) lsp.HoverOptions
	```
	
	---
	
	Hover options.
**/
@:structInit class HoverOptions {
	/**
		```lua
		(field) lsp.HoverOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	var workDoneProgress : Null<Bool>;
}