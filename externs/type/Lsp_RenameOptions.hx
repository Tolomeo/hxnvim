package externs.type;

/**
	```lua
	(class) lsp.RenameOptions
	```
	
	---
	
	Provider options for a {@link RenameRequest}.
**/
extern class Lsp_RenameOptions {
	/**
		```lua
		(field) lsp.RenameOptions.prepareProvider: boolean?
		```
		
		---
		
		
		Renames should be checked and tested before being executed.
		
	**/
	extern var prepareProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}