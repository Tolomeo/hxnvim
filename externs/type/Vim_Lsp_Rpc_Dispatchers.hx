package externs.type;

/**
	```lua
	(class) vim.lsp.rpc.Dispatchers
	```
	
	---
	
	 Dispatchers for LSP message types.
**/
@:native("vim.lsp.rpc.Dispatchers") extern class Vim_Lsp_Rpc_Dispatchers {
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.notification: fun(method: string, params: table)
		```
		
		---
		
		 @inlinedoc
		
		---
		
		```lua
		function (method: string, params: table)
		```
	**/
	extern function notification(method:String, params:lua.Table.AnyTable):Dynamic;
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.on_error: fun(code: integer, err: any)
		```
		
		---
		
		```lua
		function (code: integer, err: any)
		```
	**/
	extern function on_error(code:Int, err:Any):Dynamic;
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.on_exit: fun(code: integer, signal: integer)
		```
		
		---
		
		```lua
		function (code: integer, signal: integer)
		```
	**/
	extern function on_exit(code:Int, signal:Int):Dynamic;
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.server_request: fun(method: string, params: table):any, (lsp.ResponseError)?
		```
		
		---
		
		```lua
		function (method: string, params: table)
		  -> any
		  2. (lsp.ResponseError)?
		```
	**/
	extern function server_request(method:String, params:lua.Table.AnyTable):vim._internal.Multireturn<Null<Any>, Null<externs.type.Lsp_ResponseError>>;
}