package externs.type;

/**
	```lua
	(class) vim.api.keyset.get_mode
	```
**/
@:structInit extern class Vim_Api_Keyset_GetMode {
	/**
		```lua
		(field) vim.api.keyset.get_mode.blocking: boolean
		```
	**/
	extern var blocking : Bool;
	/**
		```lua
		(field) vim.api.keyset.get_mode.mode: string
		```
	**/
	extern var mode : String;
}