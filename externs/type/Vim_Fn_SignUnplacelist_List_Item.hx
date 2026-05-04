package externs.type;

/**
	```lua
	(class) vim.fn.sign_unplacelist.list.item
	```
**/
extern class Vim_Fn_SignUnplacelist_List_Item {
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.buffer: (string|integer)?
		```
	**/
	extern var buffer : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.group: string?
		```
	**/
	extern var group : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_unplacelist.list.item.id: integer?
		```
	**/
	extern var id : Null<Int>;
}