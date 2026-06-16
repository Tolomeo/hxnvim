package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_ns
	```
**/
@:structInit class GetNs {
	/**
		```lua
		(field) vim.api.keyset.get_ns.winid: integer?
		```
	**/
	@:optional
	var winid : Null<Int>;
}