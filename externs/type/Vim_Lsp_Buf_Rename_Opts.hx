package externs.type;

/**
	```lua
	(class) vim.lsp.buf.rename.Opts
	```
**/
@:structInit extern class Vim_Lsp_Buf_Rename_Opts {
	/**
		```lua
		(field) vim.lsp.buf.rename.Opts.bufnr: integer?
		```
		
		---
		
		
		 (default: current buffer)
	**/
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.rename.Opts.filter: fun(client: vim.lsp.Client):boolean??
		```
		
		---
		
		 @inlinedoc
		
		 Predicate used to filter clients. Receives a client as argument and
		 must return a boolean. Clients matching the predicate are included.
		
		---
		
		```lua
		function (client: vim.lsp.Client)
		  -> boolean?
		```
	**/
	extern var filter : Null<(client:externs.type.Vim_Lsp_Client) -> Null<Bool>>;
	/**
		```lua
		(field) vim.lsp.buf.rename.Opts.name: string?
		```
		
		---
		
		
		 Restrict clients used for rename to ones where client.name matches
		 this field.
	**/
	extern var name : Null<String>;
}