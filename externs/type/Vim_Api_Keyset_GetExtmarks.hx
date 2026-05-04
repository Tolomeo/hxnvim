package externs.type;

/**
	```lua
	(class) vim.api.keyset.get_extmarks
	```
**/
extern class Vim_Api_Keyset_GetExtmarks {
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.details: boolean?
		```
	**/
	extern var details : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.hl_name: boolean?
		```
	**/
	extern var hl_name : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.limit: integer?
		```
	**/
	extern var limit : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.overlap: boolean?
		```
	**/
	extern var overlap : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_extmarks.type: string?
		```
	**/
	extern var type : Null<String>;
}