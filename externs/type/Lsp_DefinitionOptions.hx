package externs.type;

/**
	```lua
	(class) lsp.DefinitionOptions
	```
	
	---
	
	Server Capabilities for a {@link DefinitionRequest}.
**/
@:native("lsp.DefinitionOptions") extern class Lsp_DefinitionOptions {
	/**
		```lua
		(field) lsp.DefinitionOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}