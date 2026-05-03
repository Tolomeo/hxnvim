package externs.type;

/**
	```lua
	(class) vim.fn.sign_placelist.list.item
	```
**/
@:native("vim.fn.sign_placelist.list.item") extern class Vim_Fn_SignPlacelist_List_Item {
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.buffer: string|integer
		```
	**/
	extern var buffer : haxe.extern.EitherType<Int, String>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.group: string?
		```
	**/
	extern var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.id: integer?
		```
	**/
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.lnum: (string|integer)?
		```
	**/
	extern var lnum : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.fn.sign_placelist.list.item.priority: integer?
		```
	**/
	extern var priority : Null<Int>;
}