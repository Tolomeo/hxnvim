package externs.type;

/**
	```lua
	(class) vim.treesitter.language.add.Opts
	```
**/
extern class Vim_Treesitter_Language_Add_Opts {
	/**
		```lua
		(field) vim.treesitter.language.add.Opts.path: string?
		```
		
		---
		
		
		Optional path the parser is located at
	**/
	extern var path : Null<String>;
	/**
		```lua
		(field) vim.treesitter.language.add.Opts.symbol_name: string?
		```
		
		---
		
		
		Internal symbol name for the language to load
	**/
	extern var symbol_name : Null<String>;
}