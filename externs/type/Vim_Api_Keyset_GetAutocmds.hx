package externs.type;

/**
	```lua
	(class) vim.api.keyset.get_autocmds
	```
**/
@:native("vim.api.keyset.get_autocmds") extern class Vim_Api_Keyset_GetAutocmds {
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.buffer: (integer|integer[])?
		```
	**/
	extern var buffer : Null<haxe.extern.EitherType<Int, Array<Int>>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.event: (string|string[])?
		```
	**/
	extern var event : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.group: (string|integer)?
		```
	**/
	extern var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.id: integer?
		```
	**/
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.pattern: (string|string[])?
		```
	**/
	extern var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}