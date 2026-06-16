package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.option
	```
**/
@:structInit class Option {
	/**
		```lua
		(field) vim.api.keyset.option.buf: integer?
		```
	**/
	@:optional
	var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.option.filetype: string?
		```
	**/
	@:optional
	var filetype : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.scope: string?
		```
	**/
	@:optional
	var scope : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.win: integer?
		```
	**/
	@:optional
	var win : Null<Int>;
}