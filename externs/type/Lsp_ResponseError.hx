package externs.type;

/**
	```lua
	(class) lsp.ResponseError
	```
**/
@:native("lsp.ResponseError") extern class Lsp_ResponseError {
	/**
		```lua
		(field) lsp.ResponseError.code: integer
		```
	**/
	extern var code : Int;
	/**
		```lua
		(field) lsp.ResponseError.data: boolean|string|number|table|table[]|nil
		```
	**/
	extern var data : haxe.extern.EitherType<String, haxe.extern.EitherType<Float, haxe.extern.EitherType<Bool, haxe.extern.EitherType<Array<lua.Table.AnyTable>, haxe.extern.EitherType<lua.Table.AnyTable, Void>>>>>;
	/**
		```lua
		(field) lsp.ResponseError.message: string
		```
	**/
	extern var message : String;
}