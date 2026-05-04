package externs.type;

/**
	```lua
	(class) vim.fn.sign_getdefined.ret.item
	```
**/
@:structInit extern class Vim_Fn_SignGetdefined_Ret_Item {
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.culhl: string?
		```
	**/
	extern var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.icon: string?
		```
	**/
	extern var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.linehl: string?
		```
	**/
	extern var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.numhl: string?
		```
	**/
	extern var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.text: string
		```
	**/
	extern var text : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.texthl: string?
		```
	**/
	extern var texthl : Null<String>;
}