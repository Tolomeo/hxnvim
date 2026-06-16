package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.keymap
	```
**/
@:structInit class Keymap {
	/**
		```lua
		(field) vim.api.keyset.keymap.callback: function?
		```
	**/
	@:optional
	var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.keymap.desc: string?
		```
	**/
	@:optional
	var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.keymap.expr: boolean?
		```
	**/
	@:optional
	var expr : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.noremap: boolean?
		```
	**/
	@:optional
	var noremap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.nowait: boolean?
		```
	**/
	@:optional
	var nowait : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.replace_keycodes: boolean?
		```
	**/
	@:optional
	var replace_keycodes : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.script: boolean?
		```
	**/
	@:optional
	var script : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.silent: boolean?
		```
	**/
	@:optional
	var silent : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.unique: boolean?
		```
	**/
	@:optional
	var unique : Null<Bool>;
}