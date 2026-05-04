package externs.type;

/**
	```lua
	(class) vim.api.keyset.get_autocmds.ret
	```
**/
extern class Vim_Api_Keyset_GetAutocmds_Ret {
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buffer: integer?
		```
	**/
	extern var buffer : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.buflocal: boolean?
		```
	**/
	extern var buflocal : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.callback: function?
		```
	**/
	extern var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.command: string?
		```
	**/
	extern var command : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.desc: string?
		```
	**/
	extern var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.event: string?
		```
	**/
	extern var event : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group: integer?
		```
	**/
	extern var group : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.group_name: integer?
		```
	**/
	extern var group_name : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.id: integer?
		```
	**/
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.once: boolean?
		```
	**/
	extern var once : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_autocmds.ret.pattern: string?
		```
	**/
	extern var pattern : Null<String>;
}