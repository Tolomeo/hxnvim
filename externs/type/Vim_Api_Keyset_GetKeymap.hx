package externs.type;

/**
	```lua
	(class) vim.api.keyset.get_keymap
	```
**/
@:native("vim.api.keyset.get_keymap") extern class Vim_Api_Keyset_GetKeymap {
	/**
		```lua
		(field) vim.api.keyset.get_keymap.abbr: (0|1)?
		```
	**/
	extern var abbr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.buffer: (0|1)?
		```
	**/
	extern var buffer : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.callback: function?
		```
	**/
	extern var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.desc: string?
		```
	**/
	extern var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.expr: (0|1)?
		```
	**/
	extern var expr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhs: string?
		```
	**/
	extern var lhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsraw: string?
		```
	**/
	extern var lhsraw : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsrawalt: string?
		```
	**/
	extern var lhsrawalt : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lnum: integer?
		```
	**/
	extern var lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode: string?
		```
	**/
	extern var mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode_bits: integer?
		```
	**/
	extern var mode_bits : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.noremap: (0|1)?
		```
	**/
	extern var noremap : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.nowait: (0|1)?
		```
	**/
	extern var nowait : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.rhs: string?
		```
	**/
	extern var rhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.script: (0|1)?
		```
	**/
	extern var script : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.scriptversion: integer?
		```
	**/
	extern var scriptversion : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.sid: integer?
		```
	**/
	extern var sid : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.silent: (0|1)?
		```
	**/
	extern var silent : Null<Float>;
}