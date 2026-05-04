package externs.type;

/**
	```lua
	(class) vim.keymap.del.Opts
	```
**/
extern class Vim_Keymap_Del_Opts {
	/**
		```lua
		(field) vim.keymap.del.Opts.buffer: (boolean|integer)?
		```
		
		---
		
		 @inlinedoc
		
		 Remove a mapping from the given buffer.
		 When `0` or `true`, use the current buffer.
	**/
	extern var buffer : Null<haxe.extern.EitherType<Int, Bool>>;
}