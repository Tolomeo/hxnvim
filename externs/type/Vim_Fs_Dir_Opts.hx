package externs.type;

/**
	```lua
	(class) vim.fs.dir.Opts
	```
**/
extern class Vim_Fs_Dir_Opts {
	/**
		```lua
		(field) vim.fs.dir.Opts.depth: integer?
		```
		
		---
		
		 @inlinedoc
		
		 How deep the traverse.
		 (default: `1`)
	**/
	extern var depth : Null<Int>;
	/**
		```lua
		(field) vim.fs.dir.Opts.follow: boolean?
		```
		
		---
		
		
		 Follow symbolic links.
		 (default: `false`)
	**/
	extern var follow : Null<Bool>;
	/**
		```lua
		(field) vim.fs.dir.Opts.skip: (fun(dir_name: string):boolean)?
		```
		
		---
		
		
		 Predicate to control traversal.
		 Return false to stop searching the current directory.
		 Only useful when depth > 1
		 Return an iterator over the items located in {path}
		
		---
		
		```lua
		function (dir_name: string)
		  -> boolean
		```
	**/
	extern var skip : Null<(dir_name:String) -> Bool>;
}