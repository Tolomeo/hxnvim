package externs.type;

@:private extern class Magic {
	extern var bar : Bool;
	extern var file : Bool;
}

/**
	```lua
	(class) vim.api.keyset.parse_cmd
	```
**/
extern class Vim_Api_Keyset_ParseCmd {
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.addr: '?'|'arg'|'buf'|'line'|'load'|'none'|'qf'|'tab'|'win'
		```
	**/
	extern var addr : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.args: string[]
		```
	**/
	extern var args : Array<String>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.bang: boolean
		```
	**/
	extern var bang : Bool;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.cmd: string
		```
	**/
	extern var cmd : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.count: integer?
		```
	**/
	extern var count : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.magic: { bar: boolean, file: boolean }
		```
	**/
	extern var magic : Magic;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.mods: vim.api.keyset.parse_cmd.mods
		```
	**/
	extern var mods : externs.type.Vim_Api_Keyset_ParseCmd_Mods;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.nargs: '*'|'+'|'0'|'1'|'?'
		```
	**/
	extern var nargs : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.nextcmd: string
		```
	**/
	extern var nextcmd : String;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.range: integer[]?
		```
	**/
	extern var range : Null<Array<Int>>;
	/**
		```lua
		(field) vim.api.keyset.parse_cmd.reg: string?
		```
	**/
	extern var reg : Null<String>;
}