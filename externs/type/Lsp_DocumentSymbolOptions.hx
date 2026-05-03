package externs.type;

/**
	```lua
	(class) lsp.DocumentSymbolOptions
	```
	
	---
	
	Provider options for a {@link DocumentSymbolRequest}.
**/
@:native("lsp.DocumentSymbolOptions") extern class Lsp_DocumentSymbolOptions {
	/**
		```lua
		(field) lsp.DocumentSymbolOptions.label: string?
		```
		
		---
		
		
		A human-readable string that is shown when multiple outlines trees
		are shown for the same document.
		
	**/
	extern var label : Null<String>;
	/**
		```lua
		(field) lsp.DocumentSymbolOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}