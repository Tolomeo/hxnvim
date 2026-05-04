package externs.type;

/**
	```lua
	(class) vim.api.keyset.option
	```
**/
@:structInit extern class Vim_Api_Keyset_Option {
	/**
		```lua
		(field) vim.api.keyset.option.buf: integer?
		```
	**/
	extern var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.option.filetype: string?
		```
	**/
	extern var filetype : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.scope: string?
		```
	**/
	extern var scope : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.option.win: integer?
		```
	**/
	extern var win : Null<Int>;
}