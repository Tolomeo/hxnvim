package externs.type;

/**
	```lua
	(class) lsp.CodeActionDisabled
	```
	
	---
	
	Captures why the code action is currently disabled.
	
**/
extern class Lsp_CodeActionDisabled {
	/**
		```lua
		(field) lsp.CodeActionDisabled.reason: string
		```
		
		---
		
		
		Human readable description of why the code action is currently disabled.
		
		This is displayed in the code actions UI.
	**/
	extern var reason : String;
}