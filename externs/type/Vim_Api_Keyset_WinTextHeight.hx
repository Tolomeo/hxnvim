package externs.type;

/**
	```lua
	(class) vim.api.keyset.win_text_height
	```
**/
@:native("vim.api.keyset.win_text_height") extern class Vim_Api_Keyset_WinTextHeight {
	/**
		```lua
		(field) vim.api.keyset.win_text_height.end_row: integer?
		```
	**/
	extern var end_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.end_vcol: integer?
		```
	**/
	extern var end_vcol : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.start_row: integer?
		```
	**/
	extern var start_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_text_height.start_vcol: integer?
		```
	**/
	extern var start_vcol : Null<Int>;
}