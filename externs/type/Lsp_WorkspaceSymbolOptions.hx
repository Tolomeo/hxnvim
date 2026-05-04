package externs.type;

/**
	```lua
	(class) lsp.WorkspaceSymbolOptions
	```
	
	---
	
	Server capabilities for a {@link WorkspaceSymbolRequest}.
**/
extern class Lsp_WorkspaceSymbolOptions {
	/**
		```lua
		(field) lsp.WorkspaceSymbolOptions.resolveProvider: boolean?
		```
		
		---
		
		
		The server provides support to resolve additional
		information for a workspace symbol.
		
	**/
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}