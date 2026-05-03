package externs.type;

/**
	```lua
	(class) vim.api.keyset.buf_delete
	```
**/
@:native("vim.api.keyset.buf_delete") extern class Vim_Api_Keyset_BufDelete {
	/**
		```lua
		(field) vim.api.keyset.buf_delete.force: boolean?
		```
	**/
	extern var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.buf_delete.unload: boolean?
		```
	**/
	extern var unload : Null<Bool>;
}