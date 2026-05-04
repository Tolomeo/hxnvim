package externs.type;

/**
	```lua
	(class) lsp.ClientFoldingRangeKindOptions
	```
**/
@:structInit extern class Lsp_ClientFoldingRangeKindOptions {
	/**
		```lua
		(field) lsp.ClientFoldingRangeKindOptions.valueSet: "comment"|"imports"|"region"[]?
		```
		
		---
		
		
		The folding range kind values the client supports. When this
		property exists the client also guarantees that it will
		handle values outside its set gracefully and falls back
		to a default value when unknown.
	**/
	extern var valueSet : Null<Array<externs.type.Lsp_FoldingRangeKind>>;
}