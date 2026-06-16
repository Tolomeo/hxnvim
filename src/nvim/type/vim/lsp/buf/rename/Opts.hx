package nvim.type.vim.lsp.buf.rename;

/**
	```lua
	(class) vim.lsp.buf.rename.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.lsp.buf.rename.Opts.bufnr: integer?
		```
		
		---
		
		
		 (default: current buffer)
	**/
	@:optional
	var bufnr : Null<Int>;
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
	@:optional
	var filter : Null<(client:nvim.type.vim.lsp.Client) -> Null<Bool>>;
	/**
		```lua
		(field) vim.lsp.buf.rename.Opts.name: string?
		```
		
		---
		
		
		 Restrict clients used for rename to ones where client.name matches
		 this field.
	**/
	@:optional
	var name : Null<String>;
}