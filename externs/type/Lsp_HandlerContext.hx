package externs.type;

/**
	```lua
	(class) lsp.HandlerContext
	```
**/
@:structInit extern class Lsp_HandlerContext {
	/**
		```lua
		(field) lsp.HandlerContext.bufnr: integer?
		```
	**/
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) lsp.HandlerContext.client_id: integer
		```
	**/
	extern var client_id : Int;
	/**
		```lua
		(field) lsp.HandlerContext.method: string
		```
	**/
	extern var method : String;
	/**
		```lua
		(field) lsp.HandlerContext.params: any
		```
	**/
	extern var params : Null<Any>;
	/**
		```lua
		(field) lsp.HandlerContext.version: integer?
		```
	**/
	extern var version : Null<Int>;
}