package nvim.type.vim.fn.sign_getdefined.ret;

/**
	```lua
	(class) vim.fn.sign_getdefined.ret.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.culhl: string?
		```
	**/
	@:optional
	var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.icon: string?
		```
	**/
	@:optional
	var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.linehl: string?
		```
	**/
	@:optional
	var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.name: string
		```
	**/
	var name : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.numhl: string?
		```
	**/
	@:optional
	var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.text: string
		```
	**/
	var text : String;
	/**
		```lua
		(field) vim.fn.sign_getdefined.ret.item.texthl: string?
		```
	**/
	@:optional
	var texthl : Null<String>;
}