package externs.type;

/**
	```lua
	(class) lsp.CodeLensOptions
	```
	
	---
	
	Code Lens provider options of a {@link CodeLensRequest}.
**/
extern class Lsp_CodeLensOptions {
	/**
		```lua
		(field) lsp.CodeLensOptions.resolveProvider: boolean?
		```
		
		---
		
		
		Code lens has a resolve provider as well.
	**/
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeLensOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}