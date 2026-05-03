package externs.type;

/**
	```lua
	(class) lsp.CallHierarchyOptions
	```
	
	---
	
	Call hierarchy options used during static registration.
	
**/
@:native("lsp.CallHierarchyOptions") extern class Lsp_CallHierarchyOptions {
	/**
		```lua
		(field) lsp.CallHierarchyOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}