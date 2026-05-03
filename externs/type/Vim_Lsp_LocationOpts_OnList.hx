package externs.type;

/**
	```lua
	(class) vim.lsp.LocationOpts.OnList
	```
**/
@:native("vim.lsp.LocationOpts.OnList") extern class Vim_Lsp_LocationOpts_OnList {
	/**
		```lua
		(field) vim.lsp.LocationOpts.OnList.context: { bufnr: integer, method: string }?
		```
		
		---
		
		Subset of `ctx` from |lsp-handler|.
	**/
	extern var context : Null<{ var bufnr : Int; var method : String; }>;
	/**
		```lua
		(field) vim.lsp.LocationOpts.OnList.items: table[]
		```
		
		---
		
		Structured like |setqflist-what|
	**/
	extern var items : Array<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.LocationOpts.OnList.title: string?
		```
		
		---
		
		Title for the list.
	**/
	extern var title : Null<String>;
}