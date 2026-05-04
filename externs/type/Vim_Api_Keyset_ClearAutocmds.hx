package externs.type;

/**
	```lua
	(class) vim.api.keyset.clear_autocmds
	```
**/
extern class Vim_Api_Keyset_ClearAutocmds {
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.buffer: integer?
		```
	**/
	extern var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.event: (string|string[])?
		```
	**/
	extern var event : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.group: (string|integer)?
		```
	**/
	extern var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.pattern: (string|string[])?
		```
	**/
	extern var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}