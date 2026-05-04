package externs.type;

/**
	```lua
	(class) lsp.FoldingRangeClientCapabilities
	```
**/
extern class Lsp_FoldingRangeClientCapabilities {
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
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.foldingRange: (lsp.ClientFoldingRangeOptions)?
		```
		
		---
		
		
		Specific options for the folding range.
		
	**/
	extern var foldingRange : Null<externs.type.Lsp_ClientFoldingRangeOptions>;
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.foldingRangeKind: (lsp.ClientFoldingRangeKindOptions)?
		```
		
		---
		
		
		Specific options for the folding range kind.
		
	**/
	extern var foldingRangeKind : Null<externs.type.Lsp_ClientFoldingRangeKindOptions>;
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.lineFoldingOnly: boolean?
		```
		
		---
		
		
		If set, the client signals that it only supports folding complete lines.
		If set, client will ignore specified `startCharacter` and `endCharacter`
		properties in a FoldingRange.
	**/
	extern var lineFoldingOnly : Null<Bool>;
	/**
		```lua
		(field) lsp.FoldingRangeClientCapabilities.rangeLimit: integer?
		```
		
		---
		
		
		The maximum number of folding ranges that the client prefers to receive
		per document. The value serves as a hint, servers are free to follow the
		limit.
	**/
	extern var rangeLimit : Null<externs.type.Uinteger>;
}