package externs.type;

@:private extern class Parsing {

}

@:private extern class ConcealChecked {

}

@:private extern class Active {

}

/**
	```lua
	(class) vim.treesitter.highlighter
	```
**/
@:structInit extern class Vim_Treesitter_Highlighter {
	/**
		```lua
		(field) vim.treesitter.highlighter._conceal_checked: table<integer, boolean>
		```
	**/
	extern var _conceal_checked : ConcealChecked;
	/**
		```lua
		(field) vim.treesitter.highlighter._conceal_line: boolean?
		```
	**/
	extern var _conceal_line : Null<Bool>;
	/**
		```lua
		(field) vim.treesitter.highlighter.active: table<integer, vim.treesitter.highlighter>
		```
	**/
	extern var active : Active;
	/**
		```lua
		(field) vim.treesitter.highlighter.bufnr: integer
		```
	**/
	extern var bufnr : Int;
	/**
		```lua
		function vim.treesitter.highlighter.new(tree: vim.treesitter.LanguageTree, opts: table|nil)
		  -> Created: vim.treesitter.highlighter
		```
		
		---
		
		
		 Creates a highlighter for `tree`.
		
		@*param* `tree` — parser object to use for highlighting
		
		@*param* `opts` — Configuration of the highlighter:
		
		           - queries table overwrite queries used by the highlighter
		
		@*return* `Created` — highlighter object
	**/
	@:native("new")
	extern static function new_(tree:externs.type.Vim_Treesitter_LanguageTree, opts:haxe.extern.EitherType<lua.Table.AnyTable, Void>):externs.type.Vim_Treesitter_Highlighter;
	/**
		```lua
		(field) vim.treesitter.highlighter.parsing: table<integer, boolean>
		```
		
		---
		
		 A map from window ID to whether we are currently parsing that window asynchronously
	**/
	extern var parsing : Parsing;
	/**
		```lua
		(field) vim.treesitter.highlighter.tree: vim.treesitter.LanguageTree
		```
	**/
	extern var tree : externs.type.Vim_Treesitter_LanguageTree;
	/**
		```lua
		(method) vim.treesitter.highlighter:destroy()
		```
		
		---
		
		 @nodoc
		 Removes all internal references to the highlighter
	**/
	extern function destroy():Dynamic;
	/**
		```lua
		(method) vim.treesitter.highlighter:get_query(lang: string)
		  -> vim.treesitter.highlighter.Query
		```
		
		---
		
		 Gets the query used for @param lang
		
		@*param* `lang` — Language used by the highlighter.
	**/
	extern function get_query(lang:String):externs.type.Vim_Treesitter_Highlighter_Query;
}