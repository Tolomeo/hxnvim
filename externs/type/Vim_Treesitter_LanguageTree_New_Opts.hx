package externs.type;

/**
	```lua
	(class) vim.treesitter.LanguageTree.new.Opts
	```
	
	---
	
	Optional arguments:
**/
@:native("vim.treesitter.LanguageTree.new.Opts") extern class Vim_Treesitter_LanguageTree_New_Opts {
	/**
		```lua
		(field) vim.treesitter.LanguageTree.new.Opts.injections: table<string, string>?
		```
	**/
	extern var injections : Null<lua.Table<String, String>>;
	/**
		```lua
		(field) vim.treesitter.LanguageTree.new.Opts.queries: table<string, string>?
		```
		
		---
		
		Deprecated
	**/
	extern var queries : Null<lua.Table<String, String>>;
}