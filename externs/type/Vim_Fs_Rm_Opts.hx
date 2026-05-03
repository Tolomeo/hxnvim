package externs.type;

/**
	```lua
	(class) vim.fs.rm.Opts
	```
**/
@:native("vim.fs.rm.Opts") extern class Vim_Fs_Rm_Opts {
	/**
		```lua
		(field) vim.fs.rm.Opts.force: boolean?
		```
		
		---
		
		
		 Ignore nonexistent files and arguments
	**/
	extern var force : Null<Bool>;
	/**
		```lua
		(field) vim.fs.rm.Opts.recursive: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Remove directories and their contents recursively
	**/
	extern var recursive : Null<Bool>;
}