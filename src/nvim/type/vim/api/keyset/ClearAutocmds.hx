package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.clear_autocmds
	```
**/
@:structInit class ClearAutocmds {
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.buffer: integer?
		```
	**/
	@:optional
	var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.event: (string|string[])?
		```
	**/
	@:optional
	var event : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.group: (string|integer)?
		```
	**/
	@:optional
	var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.clear_autocmds.pattern: (string|string[])?
		```
	**/
	@:optional
	var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}