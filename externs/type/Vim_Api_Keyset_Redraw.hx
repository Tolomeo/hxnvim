package externs.type;

/**
	```lua
	(class) vim.api.keyset.redraw
	```
**/
@:structInit extern class Vim_Api_Keyset_Redraw {
	/**
		```lua
		(field) vim.api.keyset.redraw.buf: integer?
		```
	**/
	extern var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.cursor: boolean?
		```
	**/
	extern var cursor : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.flush: boolean?
		```
	**/
	extern var flush : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.range: any[]?
		```
	**/
	extern var range : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statuscolumn: boolean?
		```
	**/
	extern var statuscolumn : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statusline: boolean?
		```
	**/
	extern var statusline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.tabline: boolean?
		```
	**/
	extern var tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.valid: boolean?
		```
	**/
	extern var valid : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.win: integer?
		```
	**/
	extern var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.winbar: boolean?
		```
	**/
	extern var winbar : Null<Bool>;
}