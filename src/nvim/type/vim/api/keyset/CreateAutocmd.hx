package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.create_autocmd
	```
**/
@:structInit class CreateAutocmd {
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.buffer: integer?
		```
	**/
	@:optional
	var buffer : Null<Int>;
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
	@:optional
	var callback : Null<haxe.extern.EitherType<String, (args:nvim.type.vim.api.keyset.create_autocmd.CallbackArgs) -> Null<Bool>>>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.command: string?
		```
	**/
	@:optional
	var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.desc: string?
		```
	**/
	@:optional
	var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.group: (string|integer)?
		```
	**/
	@:optional
	var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.nested: boolean?
		```
	**/
	@:optional
	var nested : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.once: boolean?
		```
	**/
	@:optional
	var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.create_autocmd.pattern: (string|string[])?
		```
	**/
	@:optional
	var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}