package externs.type;

/**
	```lua
	(class) lsp.ExecuteCommandOptions
	```
	
	---
	
	The server capabilities of a {@link ExecuteCommandRequest}.
**/
@:structInit extern class Lsp_ExecuteCommandOptions {
	/**
		```lua
		(field) lsp.ExecuteCommandOptions.commands: string[]
		```
		
		---
		
		
		The commands to be executed on the server
	**/
	extern var commands : Array<String>;
	/**
		```lua
		(field) lsp.ExecuteCommandOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}