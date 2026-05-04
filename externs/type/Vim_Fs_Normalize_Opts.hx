package externs.type;

/**
	```lua
	(class) vim.fs.normalize.Opts
	```
**/
@:structInit extern class Vim_Fs_Normalize_Opts {
	/**
		```lua
		(field) vim.fs.normalize.Opts.expand_env: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Expand environment variables.
		 (default: `true`)
	**/
	extern var expand_env : Null<Bool>;
	/**
		```lua
		(field) vim.fs.normalize.Opts.win: boolean?
		```
		
		---
		
		
		 Path is a Windows path.
		 (default: `true` in Windows, `false` otherwise)
	**/
	extern var win : Null<Bool>;
}