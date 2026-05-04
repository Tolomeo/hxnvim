package externs.type;

/**
	```lua
	(class) vim.lsp.get_clients.Filter
	```
	
	---
	
	 Key-value pairs used to filter the returned clients.
**/
@:structInit extern class Vim_Lsp_GetClients_Filter {
	/**
		```lua
		(field) vim.lsp.get_clients.Filter.bufnr: integer?
		```
		
		---
		
		
		 Only return clients attached to this buffer
	**/
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.lsp.get_clients.Filter.id: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Only return clients with the given id
	**/
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.lsp.get_clients.Filter.method: string?
		```
		
		---
		
		
		 Only return clients supporting the given method
	**/
	extern var method : Null<String>;
	/**
		```lua
		(field) vim.lsp.get_clients.Filter.name: string?
		```
		
		---
		
		
		 Only return clients with the given name
	**/
	extern var name : Null<String>;
}