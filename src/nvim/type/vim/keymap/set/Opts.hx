package nvim.type.vim.keymap.set;

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
@:structInit class Opts {
	/**
		```lua
		(field) vim.keymap.set.Opts.buffer: (boolean|integer)?
		```
		
		---
		
		 @inlinedoc
		
		 Creates buffer-local mapping, `0` or `true` for current buffer.
	**/
	@:optional
	var buffer : Null<haxe.extern.EitherType<Int, Bool>>;
	/**
		```lua
		(field) vim.keymap.set.Opts.callback: function?
		```
	**/
	@:optional
	var callback : Null<haxe.Constraints.Function>;
	/**
		```lua
		(field) vim.keymap.set.Opts.desc: string?
		```
	**/
	@:optional
	var desc : Null<String>;
	/**
		```lua
		(field) vim.keymap.set.Opts.expr: boolean?
		```
	**/
	@:optional
	var expr : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.noremap: boolean?
		```
	**/
	@:optional
	var noremap : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.nowait: boolean?
		```
	**/
	@:optional
	var nowait : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.remap: boolean?
		```
		
		---
		
		
		 Make the mapping recursive. Inverse of {noremap}.
		 (Default: `false`)
	**/
	@:optional
	var remap : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.replace_keycodes: boolean?
		```
	**/
	@:optional
	var replace_keycodes : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.script: boolean?
		```
	**/
	@:optional
	var script : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.silent: boolean?
		```
	**/
	@:optional
	var silent : Null<Bool>;
	/**
		```lua
		(field) vim.keymap.set.Opts.unique: boolean?
		```
	**/
	@:optional
	var unique : Null<Bool>;
}