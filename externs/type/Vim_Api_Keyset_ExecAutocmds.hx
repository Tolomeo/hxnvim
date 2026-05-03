package externs.type;

/**
	```lua
	(class) vim.api.keyset.exec_autocmds
	```
**/
@:native("vim.api.keyset.exec_autocmds") extern class Vim_Api_Keyset_ExecAutocmds {
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.buffer: integer?
		```
	**/
	extern var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.data: any
		```
	**/
	extern var data : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.group: (string|integer)?
		```
	**/
	extern var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.modeline: boolean?
		```
	**/
	extern var modeline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.pattern: (string|string[])?
		```
	**/
	extern var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}