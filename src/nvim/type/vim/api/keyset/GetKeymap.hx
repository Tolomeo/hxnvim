package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_keymap
	```
**/
@:structInit class GetKeymap {
	/**
		```lua
		(field) vim.api.keyset.get_keymap.abbr: (0|1)?
		```
	**/
	@:optional
	var abbr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.buffer: (0|1)?
		```
	**/
	@:optional
	var buffer : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.callback: function?
		```
	**/
	@:optional
	var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.desc: string?
		```
	**/
	@:optional
	var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.expr: (0|1)?
		```
	**/
	@:optional
	var expr : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhs: string?
		```
	**/
	@:optional
	var lhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsraw: string?
		```
	**/
	@:optional
	var lhsraw : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lhsrawalt: string?
		```
	**/
	@:optional
	var lhsrawalt : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.lnum: integer?
		```
	**/
	@:optional
	var lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode: string?
		```
	**/
	@:optional
	var mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.mode_bits: integer?
		```
	**/
	@:optional
	var mode_bits : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.noremap: (0|1)?
		```
	**/
	@:optional
	var noremap : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.nowait: (0|1)?
		```
	**/
	@:optional
	var nowait : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.rhs: string?
		```
	**/
	@:optional
	var rhs : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.script: (0|1)?
		```
	**/
	@:optional
	var script : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.scriptversion: integer?
		```
	**/
	@:optional
	var scriptversion : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.sid: integer?
		```
	**/
	@:optional
	var sid : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_keymap.silent: (0|1)?
		```
	**/
	@:optional
	var silent : Null<Float>;
}