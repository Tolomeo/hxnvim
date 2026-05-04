package externs.type;

/**
	```lua
	(class) lsp.ChangeAnnotationsSupportOptions
	```
**/
extern class Lsp_ChangeAnnotationsSupportOptions {
	/**
		```lua
		(field) lsp.ChangeAnnotationsSupportOptions.groupsOnLabel: boolean?
		```
		
		---
		
		
		Whether the client groups edits with equal labels into tree nodes,
		for instance all edits labelled with "Changes in Strings" would
		be a tree node.
	**/
	extern var groupsOnLabel : Null<Bool>;
}