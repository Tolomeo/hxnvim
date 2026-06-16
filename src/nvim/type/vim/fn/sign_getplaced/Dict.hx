package nvim.type.vim.fn.sign_getplaced;

/**
	```lua
	(class) vim.fn.sign_getplaced.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.group: string?
		```
	**/
	@:optional
	var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.id: integer?
		```
	**/
	@:optional
	var id : Null<Int>;
	/**
		```lua
		(field) vim.fn.sign_getplaced.dict.lnum: (string|integer)?
		```
	**/
	@:optional
	var lnum : Null<haxe.extern.EitherType<String, Int>>;
}