package externs.type;

/**
	```lua
	(class) lsp.ReferenceContext
	```
	
	---
	
	Value-object that contains additional information when
	requesting references.
**/
@:structInit extern class Lsp_ReferenceContext {
	/**
		```lua
		(field) lsp.ReferenceContext.includeDeclaration: boolean
		```
		
		---
		
		
		Include the declaration of the current symbol.
	**/
	extern var includeDeclaration : Bool;
}