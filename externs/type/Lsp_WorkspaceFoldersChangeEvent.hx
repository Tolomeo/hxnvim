package externs.type;

/**
	```lua
	(class) lsp.WorkspaceFoldersChangeEvent
	```
	
	---
	
	The workspace folder change event.
**/
@:structInit extern class Lsp_WorkspaceFoldersChangeEvent {
	/**
		```lua
		(field) lsp.WorkspaceFoldersChangeEvent.added: lsp.WorkspaceFolder[]
		```
		
		---
		
		
		The array of added workspace folders
	**/
	extern var added : Array<externs.type.Lsp_WorkspaceFolder>;
	/**
		```lua
		(field) lsp.WorkspaceFoldersChangeEvent.removed: lsp.WorkspaceFolder[]
		```
		
		---
		
		
		The array of the removed workspace folders
	**/
	extern var removed : Array<externs.type.Lsp_WorkspaceFolder>;
}