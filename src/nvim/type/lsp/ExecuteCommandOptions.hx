package nvim.type.lsp;

/**
	```lua
	(class) lsp.ExecuteCommandOptions
	```
	
	---
	
	The server capabilities of a {@link ExecuteCommandRequest}.
**/
@:structInit class ExecuteCommandOptions {
	/**
		```lua
		(field) lsp.ExecuteCommandOptions.commands: string[]
		```
		
		---
		
		
		The commands to be executed on the server
	**/
	var commands : Array<String>;
	/**
		```lua
		(field) lsp.ExecuteCommandOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	var workDoneProgress : Null<Bool>;
}