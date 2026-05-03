package externs.type;

/**
	```lua
	(class) lsp.TypeHierarchyOptions
	```
	
	---
	
	Type hierarchy options used during static registration.
	
**/
@:native("lsp.TypeHierarchyOptions") extern class Lsp_TypeHierarchyOptions {
	/**
		```lua
		(field) lsp.TypeHierarchyOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}