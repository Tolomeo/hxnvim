package externs.type;

/**
	```lua
	(class) vim.SystemCompleted
	```
**/
@:native("vim.SystemCompleted") extern class Vim_SystemCompleted {
	/**
		```lua
		(field) vim.SystemCompleted.code: integer
		```
	**/
	extern var code : Int;
	/**
		```lua
		(field) vim.SystemCompleted.signal: integer
		```
	**/
	extern var signal : Int;
	/**
		```lua
		(field) vim.SystemCompleted.stderr: string?
		```
	**/
	extern var stderr : Null<String>;
	/**
		```lua
		(field) vim.SystemCompleted.stdout: string?
		```
	**/
	extern var stdout : Null<String>;
}