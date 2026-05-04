package externs.type;

/**
	```lua
	(class) vim.keymap.set.Opts
	```
	
	---
	
	 Table of |:map-arguments|.
	 Same as |nvim_set_keymap()| {opts}, except:
	 - {replace_keycodes} defaults to `true` if "expr" is `true`.
	
	 Also accepts:
**/
@:structInit extern class Vim_Keymap_Set_Opts {
	/**
		```lua
		(field) vim.keymap.set.Opts.buffer: (boolean|integer)?
		```
		
		---
		
		 @inlinedoc
		
		 Creates buffer-local mapping, `0` or `true` for current buffer.
	**/
	extern var buffer : Null<haxe.extern.EitherType<Int, Bool>>;
	/**
		```lua
		(field) vim.keymap.set.Opts.callback: function?
		```
	**/
	extern var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.keymap.set.Opts.desc: string?
		```
	**/
	extern var desc : Null<String>;
	/**
		```lua
		(field) vim.keymap.set.Opts.expr: boolean?
		```
	**/
	extern var expr : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.noremap: boolean?
		```
	**/
	extern var noremap : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.nowait: boolean?
		```
	**/
	extern var nowait : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.remap: boolean?
		```
		
		---
		
		
		 Make the mapping recursive. Inverse of {noremap}.
		 (Default: `false`)
	**/
	extern var remap : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.replace_keycodes: boolean?
		```
	**/
	extern var replace_keycodes : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.script: boolean?
		```
	**/
	extern var script : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.silent: boolean?
		```
	**/
	extern var silent : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.unique: boolean?
		```
	**/
	extern var unique : Null<Bool>;
}