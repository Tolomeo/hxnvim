package externs.type;

/**
	```lua
	(class) lsp.DocumentSymbolClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link DocumentSymbolRequest}.
**/
@:native("lsp.DocumentSymbolClientCapabilities") extern class Lsp_DocumentSymbolClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether document symbol supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.hierarchicalDocumentSymbolSupport: boolean?
		```
		
		---
		
		
		The client supports hierarchical document symbols.
	**/
	extern var hierarchicalDocumentSymbolSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.labelSupport: boolean?
		```
		
		---
		
		
		The client supports an additional label presented in the UI when
		registering a document symbol provider.
		
	**/
	extern var labelSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.symbolKind: (lsp.ClientSymbolKindOptions)?
		```
		
		---
		
		
		Specific capabilities for the `SymbolKind` in the
		`textDocument/documentSymbol` request.
	**/
	extern var symbolKind : Null<externs.type.Lsp_ClientSymbolKindOptions>;
	/**
		```lua
		(field) lsp.DocumentSymbolClientCapabilities.tagSupport: (lsp.ClientSymbolTagOptions)?
		```
		
		---
		
		
		The client supports tags on `SymbolInformation`. Tags are supported on
		`DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	extern var tagSupport : Null<externs.type.Lsp_ClientSymbolTagOptions>;
}