package nvim.type.lsp;

/**
	```lua
	(class) lsp.FoldingRangeClientCapabilities
	```
**/
@:structInit class FoldingRangeClientCapabilities {
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration for folding range
		providers. If this is set to `true` the client supports the new
		`FoldingRangeRegistrationOptions` return value for the corresponding
		server capability as well.
	**/
	@:optional
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.foldingRange: (lsp.ClientFoldingRangeOptions)?
		```
		
		---
		
		
		Specific options for the folding range.
		
	**/
	@:optional
	var foldingRange : Null<nvim.type.lsp.ClientFoldingRangeOptions>;
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.foldingRangeKind: (lsp.ClientFoldingRangeKindOptions)?
		```
		
		---
		
		
		Specific options for the folding range kind.
		
	**/
	@:optional
	var foldingRangeKind : Null<nvim.type.lsp.ClientFoldingRangeKindOptions>;
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.lineFoldingOnly: boolean?
		```
		
		---
		
		
		If set, the client signals that it only supports folding complete lines.
		If set, client will ignore specified `startCharacter` and `endCharacter`
		properties in a FoldingRange.
	**/
	@:optional
	var lineFoldingOnly : Null<Bool>;
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.rangeLimit: integer?
		```
		
		---
		
		
		The maximum number of folding ranges that the client prefers to receive
		per document. The value serves as a hint, servers are free to follow the
		limit.
	**/
	@:optional
	var rangeLimit : Null<nvim.type.Uinteger>;
}