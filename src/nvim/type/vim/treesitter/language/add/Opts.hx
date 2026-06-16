package nvim.type.vim.treesitter.language.add;

/**
	```lua
	(class) vim.treesitter.language.add.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.treesitter.language.add.Opts.path: string?
		```
		
		---
		
		
		Optional path the parser is located at
	**/
	@:optional
	var path : Null<String>;
	/**
		```lua
		(field) vim.treesitter.language.add.Opts.symbol_name: string?
		```
		
		---
		
		
		Internal symbol name for the language to load
	**/
	@:optional
	var symbol_name : Null<String>;
}