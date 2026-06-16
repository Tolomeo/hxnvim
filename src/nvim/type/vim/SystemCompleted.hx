package nvim.type.vim;

/**
	```lua
	(class) vim.SystemCompleted
	```
**/
@:structInit class SystemCompleted {
	/**
		```lua
		(field) vim.SystemCompleted.code: integer
		```
	**/
	var code : Int;
	/**
		```lua
		(field) vim.SystemCompleted.signal: integer
		```
	**/
	var signal : Int;
	/**
		```lua
		(field) vim.SystemCompleted.stderr: string?
		```
	**/
	var stderr : Null<String>;
	/**
		```lua
		(field) vim.SystemCompleted.stdout: string?
		```
	**/
	var stdout : Null<String>;
}