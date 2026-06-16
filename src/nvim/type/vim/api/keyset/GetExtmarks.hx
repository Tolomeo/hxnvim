package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_extmarks
	```
**/
@:structInit class GetExtmarks {
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.details: boolean?
		```
	**/
	@:optional
	var details : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.hl_name: boolean?
		```
	**/
	@:optional
	var hl_name : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.limit: integer?
		```
	**/
	@:optional
	var limit : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.overlap: boolean?
		```
	**/
	@:optional
	var overlap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.type: string?
		```
	**/
	@:optional
	var type : Null<String>;
}