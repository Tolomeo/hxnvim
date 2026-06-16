package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.buf_delete
	```
**/
@:structInit class BufDelete {
	/**
		```lua
		(field) vim.api.keyset.buf_delete.force: boolean?
		```
	**/
	@:optional
	var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.buf_delete.unload: boolean?
		```
	**/
	@:optional
	var unload : Null<Bool>;
}