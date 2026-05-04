package externs.type;

/**
	```lua
	(class) lsp.ChangeAnnotation
	```
	
	---
	
	Additional information that describes document changes.
	
**/
extern class Lsp_ChangeAnnotation {
	/**
		```lua
		(field) lsp.ChangeAnnotation.description: string?
		```
		
		---
		
		
		A human-readable string which is rendered less prominent in
		the user interface.
	**/
	extern var description : Null<String>;
	/**
		```lua
		(field) lsp.ChangeAnnotation.label: string
		```
		
		---
		
		
		A human-readable string describing the actual change. The string
		is rendered prominent in the user interface.
	**/
	extern var label : String;
	/**
		```lua
		(field) lsp.ChangeAnnotation.needsConfirmation: boolean?
		```
		
		---
		
		
		A flag which indicates that user confirmation is needed
		before applying the change.
	**/
	extern var needsConfirmation : Null<Bool>;
}