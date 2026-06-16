package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.exec_autocmds
	```
**/
@:structInit class ExecAutocmds {
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.buffer: integer?
		```
	**/
	@:optional
	var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.data: any
		```
	**/
	@:optional
	var data : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.group: (string|integer)?
		```
	**/
	@:optional
	var group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.modeline: boolean?
		```
	**/
	@:optional
	var modeline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.exec_autocmds.pattern: (string|string[])?
		```
	**/
	@:optional
	var pattern : Null<haxe.extern.EitherType<String, Array<String>>>;
}