package externs.type;

/**
	```lua
	(class) lsp.WorkspaceFolder
	```
	
	---
	
	A workspace folder inside a client.
**/
extern class Lsp_WorkspaceFolder {
	/**
		```lua
		(field) lsp.WorkspaceFolder.name: string
		```
		
		---
		
		
		The name of the workspace folder. Used to refer to this
		workspace folder in the user interface.
	**/
	extern var name : String;
	/**
		```lua
		(field) lsp.WorkspaceFolder.uri: string
		```
		
		---
		
		
		The associated URI for this workspace folder.
	**/
	extern var uri : externs.type.Lsp_URI;
}