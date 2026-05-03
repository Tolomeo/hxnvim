package externs.type;

/**
	```lua
	(class) vim.fn.sign_place.dict
	```
**/
@:native("vim.fn.sign_place.dict") extern class Vim_Fn_SignPlace_Dict {
	/**
		```lua
		(field) vim.fn.sign_place.dict.lnum: (string|integer)?
		```
	**/
	extern var lnum : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_place.dict.priority: integer?
		```
	**/
	extern var priority : Null<Int>;
}