package externs.type;

/**
	```lua
	(class) lsp.ClientDiagnosticsTagOptions
	```
**/
extern class Lsp_ClientDiagnosticsTagOptions {
	/**
		```lua
		(field) lsp.ClientDiagnosticsTagOptions.valueSet: 1|2[]
		```
		
		---
		
		
		The tags supported by the client.
	**/
	extern var valueSet : Array<externs.type.Lsp_DiagnosticTag>;
}