package externs.type;

/**
	```lua
	(class) lsp.PublishDiagnosticsParams
	```
	
	---
	
	The publish diagnostic notification's parameters.
**/
@:structInit extern class Lsp_PublishDiagnosticsParams {
	/**
		```lua
		(field) lsp.PublishDiagnosticsParams.diagnostics: lsp.Diagnostic[]
		```
		
		---
		
		
		An array of diagnostic information items.
	**/
	extern var diagnostics : Array<externs.type.Lsp_Diagnostic>;
	/**
		```lua
		(field) lsp.PublishDiagnosticsParams.uri: string
		```
		
		---
		
		
		The URI for which diagnostic information is reported.
	**/
	extern var uri : externs.type.Lsp_DocumentUri;
	/**
		```lua
		(field) lsp.PublishDiagnosticsParams.version: integer?
		```
		
		---
		
		
		Optional the version number of the document the diagnostics are published for.
		
	**/
	extern var version : Null<Int>;
}