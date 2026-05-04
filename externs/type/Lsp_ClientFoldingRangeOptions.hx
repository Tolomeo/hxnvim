package externs.type;

/**
	```lua
	(class) lsp.ClientFoldingRangeOptions
	```
**/
@:structInit extern class Lsp_ClientFoldingRangeOptions {
	/**
		```lua
		(field) lsp.ClientFoldingRangeOptions.collapsedText: boolean?
		```
		
		---
		
		
		If set, the client signals that it supports setting collapsedText on
		folding ranges to display custom labels instead of the default text.
		
	**/
	extern var collapsedText : Null<Bool>;
}