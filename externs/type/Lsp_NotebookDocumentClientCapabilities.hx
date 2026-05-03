package externs.type;

/**
	```lua
	(class) lsp.NotebookDocumentClientCapabilities
	```
	
	---
	
	Capabilities specific to the notebook document support.
	
**/
@:native("lsp.NotebookDocumentClientCapabilities") extern class Lsp_NotebookDocumentClientCapabilities {
	/**
		```lua
		(field) lsp.NotebookDocumentClientCapabilities.synchronization: lsp.NotebookDocumentSyncClientCapabilities
		```
		
		---
		
		Notebook specific client capabilities.
		
		
		---
		
		
		Capabilities specific to notebook document synchronization
		
	**/
	extern var synchronization : externs.type.Lsp_NotebookDocumentSyncClientCapabilities;
}