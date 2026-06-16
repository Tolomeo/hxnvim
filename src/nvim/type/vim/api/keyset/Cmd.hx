package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.cmd
	```
**/
@:structInit class Cmd {
	/**
		```lua
		(field) vim.api.keyset.cmd.addr: string?
		```
	**/
	@:optional
	var addr : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.args: string[]?
		```
	**/
	@:optional
	var args : Null<Array<String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.bang: boolean?
		```
	**/
	@:optional
	var bang : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.cmd.cmd: string?
		```
	**/
	@:optional
	var cmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.count: integer?
		```
	**/
	@:optional
	var count : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.cmd.magic: table<string, any>?
		```
	**/
	@:optional
	var magic : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.mods: table<string, any>?
		```
	**/
	@:optional
	var mods : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nargs: (string|integer)?
		```
	**/
	@:optional
	var nargs : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nextcmd: string?
		```
	**/
	@:optional
	var nextcmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.range: any[]?
		```
	**/
	@:optional
	var range : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.reg: string?
		```
	**/
	@:optional
	var reg : Null<String>;
}