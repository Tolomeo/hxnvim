package nvim.type.vim.lsp.rpc;

/**
	```lua
	(class) vim.lsp.rpc.Dispatchers
	```
	
	---
	
	 Dispatchers for LSP message types.
**/
@:structInit class Dispatchers {
	@:luaDotMethod
	private extern function __notification(method:String, params:lua.Table.AnyTable):Dynamic;
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
	@:luaDotMethod
	inline function notification(method:String, params:lua.Table.AnyTable):Dynamic {
		return __notification(method,params);
	}
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.on_error: fun(code: integer, err: any)
		```
		
		---
		
		```lua
		function (code: integer, err: any)
		```
	**/
	@:luaDotMethod
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
	@:luaDotMethod
	extern function on_exit(code:Int, signal:Int):Dynamic;
	@:luaDotMethod
	private extern function __server_request(method:String, params:lua.Table.AnyTable):nvim.helper.Multireturn<Null<Any>, Null<nvim.type.lsp.ResponseError>, Void, Void, Void, Void>;
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
	@:luaDotMethod
	inline function server_request(method:String, params:lua.Table.AnyTable):nvim.helper.Multireturn<Null<Any>, Null<nvim.type.lsp.ResponseError>, Void, Void, Void, Void> {
		return __server_request(method,params);
	}
}