package nvim.type.vim.api.keyset.get_autocmds;

/**
	```lua
	(class) vim.api.keyset.get_autocmds.ret
	```
**/
@:structInit class Ret {
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buffer: integer?
		```
	**/
	@:optional
	var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buflocal: boolean?
		```
	**/
	@:optional
	var buflocal : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.callback: function?
		```
	**/
	@:optional
	var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.command: string?
		```
	**/
	@:optional
	var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.desc: string?
		```
	**/
	@:optional
	var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.event: string?
		```
	**/
	@:optional
	var event : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group: integer?
		```
	**/
	@:optional
	var group : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group_name: integer?
		```
	**/
	@:optional
	var group_name : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.id: integer?
		```
	**/
	@:optional
	var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.once: boolean?
		```
	**/
	@:optional
	var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.pattern: string?
		```
	**/
	@:optional
	var pattern : Null<String>;
}