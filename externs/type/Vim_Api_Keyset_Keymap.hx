package externs.type;

/**
	```lua
	(class) vim.api.keyset.keymap
	```
**/
extern class Vim_Api_Keyset_Keymap {
	/**
		```lua
		(field) vim.api.keyset.keymap.callback: function?
		```
	**/
	extern var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.api.keyset.keymap.desc: string?
		```
	**/
	extern var desc : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.keymap.expr: boolean?
		```
	**/
	extern var expr : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.noremap: boolean?
		```
	**/
	extern var noremap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.nowait: boolean?
		```
	**/
	extern var nowait : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.replace_keycodes: boolean?
		```
	**/
	extern var replace_keycodes : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.script: boolean?
		```
	**/
	extern var script : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.silent: boolean?
		```
	**/
	extern var silent : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.keymap.unique: boolean?
		```
	**/
	extern var unique : Null<Bool>;
}