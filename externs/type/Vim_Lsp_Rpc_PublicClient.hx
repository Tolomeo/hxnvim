package externs.type;

/**
	```lua
	(class) vim.lsp.rpc.PublicClient
	```
	
	---
	
	 Client RPC object
**/
@:native("vim.lsp.rpc.PublicClient") extern class Vim_Lsp_Rpc_PublicClient {
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.is_closing: fun():boolean
		```
		
		---
		
		
		 Indicates if the RPC is closing.
		
		---
		
		```lua
		function ()
		  -> boolean
		```
	**/
	extern function is_closing():Bool;
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.notify: fun(method: string, params: any):boolean
		```
		
		---
		
		
		 See [vim.lsp.rpc.notify()]
		
		---
		
		```lua
		function (method: string, params: any)
		  -> boolean
		```
	**/
	extern function notify(method:String, params:Any):Bool;
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.request: fun(method: string, params?: table, callback: fun(err?: lsp.ResponseError, result: any), notify_reply_callback?: fun(message_id: integer)):boolean, integer?
		```
		
		---
		
		
		 See [vim.lsp.rpc.request()]
		
		---
		
		```lua
		function (method: string, params: table?, callback: fun(err?: lsp.ResponseError, result: any), notify_reply_callback?: fun(message_id: integer))
		  -> boolean
		  2. integer?
		```
	**/
	extern function request(method:String, params:Null<lua.Table.AnyTable>, callback:(err:externs.type.Lsp_ResponseError, result:Any) -> Dynamic, notify_reply_callback:(message_id:Int) -> Dynamic):vim._internal.Multireturn<Bool, Null<Int>>;
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.terminate: fun()
		```
		
		---
		
		
		 Terminates the RPC client.
		
		---
		
		```lua
		function ()
		```
	**/
	extern function terminate():Dynamic;
}