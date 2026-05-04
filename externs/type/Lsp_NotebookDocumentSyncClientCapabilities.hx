package externs.type;

/**
	```lua
	(class) lsp.NotebookDocumentSyncClientCapabilities
	```
	
	---
	
	Notebook specific client capabilities.
	
**/
extern class Lsp_NotebookDocumentSyncClientCapabilities {
	/**
		```lua
		(field) lsp.NotebookDocumentSyncClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is
		set to `true` the client supports the new
		`(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
		return value for the corresponding server capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.NotebookDocumentSyncClientCapabilities.executionSummarySupport: boolean?
		```
		
		---
		
		
		The client supports sending execution summary data per cell.
	**/
	extern var executionSummarySupport : Null<Bool>;
}