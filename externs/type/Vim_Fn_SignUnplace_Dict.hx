package externs.type;

/**
	```lua
	(class) vim.fn.sign_unplace.dict
	```
**/
@:structInit extern class Vim_Fn_SignUnplace_Dict {
	/**
		```lua
		(field) vim.fn.sign_unplace.dict.buffer: (string|integer)?
		```
	**/
	extern var buffer : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_unplace.dict.id: integer?
		```
	**/
	extern var id : Null<Int>;
}