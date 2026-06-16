package nvim.type.lsp;

/**
	```lua
	(class) lsp.FoldingRangeOptions
	```
**/
@:structInit class FoldingRangeOptions {
	/**
		```lua
		(field) lsp.FoldingRangeOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	var workDoneProgress : Null<Bool>;
}