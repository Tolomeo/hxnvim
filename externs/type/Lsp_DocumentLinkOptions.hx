package externs.type;

/**
	```lua
	(class) lsp.DocumentLinkOptions
	```
	
	---
	
	Provider options for a {@link DocumentLinkRequest}.
**/
extern class Lsp_DocumentLinkOptions {
	/**
		```lua
		(field) lsp.DocumentLinkOptions.resolveProvider: boolean?
		```
		
		---
		
		
		Document links have a resolve provider as well.
	**/
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentLinkOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}