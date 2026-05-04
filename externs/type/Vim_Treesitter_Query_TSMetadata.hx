package externs.type;

/**
	```lua
	(class) vim.treesitter.query.TSMetadata
	```
**/
extern class Vim_Treesitter_Query_TSMetadata {
	/**
		```lua
		(field) vim.treesitter.query.TSMetadata.conceal: string?
		```
	**/
	extern var conceal : Null<String>;
	/**
		```lua
		(field) vim.treesitter.query.TSMetadata.range: (Range2|Range4|Range6)?
		```
	**/
	extern var range : Null<externs.type.Range>;
}