package externs.type;

/**
	```lua
	(class) vim.treesitter.query.add_predicate.Opts
	```
**/
@:structInit extern class Vim_Treesitter_Query_AddPredicate_Opts {
	/**
		```lua
		(field) vim.treesitter.query.add_predicate.Opts.all: boolean?
		```
		
		---
		
		
		 Use the correct implementation of the match table where capture IDs map to
		 a list of nodes instead of a single node. Defaults to true. This option will
		 be removed in a future release.
	**/
	extern var all : Null<Bool>;
	/**
		```lua
		(field) vim.treesitter.query.add_predicate.Opts.force: boolean?
		```
		
		---
		
		 @inlinedoc
		
		 Override an existing predicate of the same name
	**/
	extern var force : Null<Bool>;
}