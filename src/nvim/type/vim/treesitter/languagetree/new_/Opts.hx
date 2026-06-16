package nvim.type.vim.treesitter.languagetree.new_;

/**
	```lua
	(class) vim.treesitter.LanguageTree.new.Opts
	```
	
	---
	
	Optional arguments:
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.treesitter.LanguageTree.new.Opts.injections: table<string, string>?
		```
	**/
	@:optional
	var injections : Null<lua.Table<String, String>>;
	/**
		```lua
		(field) vim.treesitter.LanguageTree.new.Opts.queries: table<string, string>?
		```
		
		---
		
		Deprecated
	**/
	@:optional
	var queries : Null<lua.Table<String, String>>;
}