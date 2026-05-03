package externs.type;

/**
	```lua
	(class) vim.fn.sign
	```
**/
@:native("vim.fn.sign") extern class Vim_Fn_Sign {
	/**
		```lua
		(field) vim.fn.sign.group: string
		```
	**/
	extern var group : String;
	/**
		```lua
		(field) vim.fn.sign.id: integer
		```
	**/
	extern var id : Int;
	/**
		```lua
		(field) vim.fn.sign.lnum: integer
		```
	**/
	extern var lnum : Int;
	/**
		```lua
		(field) vim.fn.sign.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.fn.sign.priority: integer
		```
	**/
	extern var priority : Int;
}