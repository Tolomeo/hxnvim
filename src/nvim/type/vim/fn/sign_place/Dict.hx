package nvim.type.vim.fn.sign_place;

/**
	```lua
	(class) vim.fn.sign_place.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.sign_place.dict.lnum: (string|integer)?
		```
	**/
	@:optional
	var lnum : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_place.dict.priority: integer?
		```
	**/
	@:optional
	var priority : Null<Int>;
}