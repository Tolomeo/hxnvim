package externs.type;

/**
	```lua
	(class) vim.api.keyset.cmd
	```
**/
extern class Vim_Api_Keyset_Cmd {
	/**
		```lua
		(field) vim.api.keyset.cmd.addr: string?
		```
	**/
	extern var addr : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.args: string[]?
		```
	**/
	extern var args : Null<Array<String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.bang: boolean?
		```
	**/
	extern var bang : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.cmd.cmd: string?
		```
	**/
	extern var cmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.count: integer?
		```
	**/
	extern var count : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.cmd.magic: table<string, any>?
		```
	**/
	extern var magic : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.mods: table<string, any>?
		```
	**/
	extern var mods : Null<lua.Table<String, Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nargs: (string|integer)?
		```
	**/
	extern var nargs : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.nextcmd: string?
		```
	**/
	extern var nextcmd : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.cmd.range: any[]?
		```
	**/
	extern var range : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.cmd.reg: string?
		```
	**/
	extern var reg : Null<String>;
}