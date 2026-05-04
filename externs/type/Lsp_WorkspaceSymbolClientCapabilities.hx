package externs.type;

/**
	```lua
	(class) lsp.WorkspaceSymbolClientCapabilities
	```
	
	---
	
	Client capabilities for a {@link WorkspaceSymbolRequest}.
**/
@:structInit extern class Lsp_WorkspaceSymbolClientCapabilities {
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Symbol request supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.resolveSupport: (lsp.ClientSymbolResolveOptions)?
		```
		
		---
		
		
		The client support partial workspace symbols. The client will send the
		request `workspaceSymbol/resolve` to the server to resolve additional
		properties.
		
	**/
	extern var resolveSupport : Null<externs.type.Lsp_ClientSymbolResolveOptions>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.symbolKind: (lsp.ClientSymbolKindOptions)?
		```
		
		---
		
		
		Specific capabilities for the `SymbolKind` in the `workspace/symbol` request.
	**/
	extern var symbolKind : Null<externs.type.Lsp_ClientSymbolKindOptions>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolClientCapabilities.tagSupport: (lsp.ClientSymbolTagOptions)?
		```
		
		---
		
		
		The client supports tags on `SymbolInformation`.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	extern var tagSupport : Null<externs.type.Lsp_ClientSymbolTagOptions>;
}