package externs.type;

/**
	```lua
	(class) vim.treesitter.LanguageTree.tree_for_range.Opts
	```
**/
@:native("vim.treesitter.LanguageTree.tree_for_range.Opts") extern class Vim_Treesitter_LanguageTree_TreeForRange_Opts {
	/**
		```lua
		(field) vim.treesitter.LanguageTree.tree_for_range.Opts.ignore_injections: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Ignore injected languages
		 (default: `true`)
	**/
	extern var ignore_injections : Null<Bool>;
}