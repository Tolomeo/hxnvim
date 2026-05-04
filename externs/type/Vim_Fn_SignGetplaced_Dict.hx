package externs.type;

/**
	```lua
	(class) vim.fn.sign_getplaced.dict
	```
**/
@:structInit extern class Vim_Fn_SignGetplaced_Dict {
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.group: string?
		```
	**/
	extern var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.id: integer?
		```
	**/
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.lnum: (string|integer)?
		```
	**/
	extern var lnum : Null<haxe.extern.EitherType<String, Int>>;
}