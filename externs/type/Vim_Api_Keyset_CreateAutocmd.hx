package externs.type;

/**
	```lua
	(class) vim.api.keyset.create_autocmd
	```
**/
@:structInit extern class Vim_Api_Keyset_CreateAutocmd {
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.buffer: integer?
		```
	**/
	extern var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.callback: (string|fun(args: vim.api.keyset.create_autocmd.callback_args):boolean?)?
		```
		
		---
		
		```lua
		function (args: vim.api.keyset.create_autocmd.callback_args)
		  -> boolean?
		```
	**/
	extern var callback : Null<haxe.extern.EitherType<String, (args:externs.type.Vim_Api_Keyset_CreateAutocmd_CallbackArgs) -> Null<Bool>>>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.command: string?
		```
	**/
	extern var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.desc: string?
		```
	**/
	extern var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.group: (string|integer)?
		```
	**/
	extern var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.nested: boolean?
		```
	**/
	extern var nested : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.once: boolean?
		```
	**/
	extern var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.pattern: (string|string[])?
		```
	**/
	extern var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}