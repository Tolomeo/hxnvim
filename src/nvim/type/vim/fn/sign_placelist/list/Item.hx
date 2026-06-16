package nvim.type.vim.fn.sign_placelist.list;

/**
	```lua
	(class) vim.fn.sign_placelist.list.item
	```
**/
@:structInit class Item {
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.buffer: string|integer
		```
	**/
	var buffer : haxe.extern.EitherType<Int, String>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.group: string?
		```
	**/
	@:optional
	var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.id: integer?
		```
	**/
	@:optional
	var id : Null<Int>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.lnum: (string|integer)?
		```
	**/
	@:optional
	var lnum : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.name: string
		```
	**/
	var name : String;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.priority: integer?
		```
	**/
	@:optional
	var priority : Null<Int>;
}