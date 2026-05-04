package externs.type;

/**
	```lua
	(class) vim.treesitter.get_node.Opts
	```
	
	---
	
	 Optional keyword arguments:
**/
extern class Vim_Treesitter_GetNode_Opts {
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.bufnr: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Buffer number (nil or 0 for current buffer)
	**/
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.ignore_injections: boolean?
		```
		
		---
		
		
		 Ignore injected languages (default true)
	**/
	extern var ignore_injections : Null<Bool>;
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.include_anonymous: boolean?
		```
		
		---
		
		
		 Include anonymous nodes (default false)
	**/
	extern var include_anonymous : Null<Bool>;
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.lang: string?
		```
		
		---
		
		
		 Parser language. (default: from buffer filetype)
	**/
	extern var lang : Null<String>;
	/**
		```lua
		(field) vim.treesitter.get_node.Opts.pos: [integer, integer]?
		```
		
		---
		
		
		 0-indexed (row, col) tuple. Defaults to cursor position in the
		 current window. Required if {bufnr} is not the current buffer
	**/
	extern var pos : Dynamic;
}