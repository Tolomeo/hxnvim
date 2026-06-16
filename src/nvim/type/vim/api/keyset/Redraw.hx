package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.redraw
	```
**/
@:structInit class Redraw {
	/**
		```lua
		(field) vim.api.keyset.redraw.buf: integer?
		```
	**/
	@:optional
	var buf : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.cursor: boolean?
		```
	**/
	@:optional
	var cursor : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.flush: boolean?
		```
	**/
	@:optional
	var flush : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.range: any[]?
		```
	**/
	@:optional
	var range : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statuscolumn: boolean?
		```
	**/
	@:optional
	var statuscolumn : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.statusline: boolean?
		```
	**/
	@:optional
	var statusline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.tabline: boolean?
		```
	**/
	@:optional
	var tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.valid: boolean?
		```
	**/
	@:optional
	var valid : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.redraw.win: integer?
		```
	**/
	@:optional
	var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.redraw.winbar: boolean?
		```
	**/
	@:optional
	var winbar : Null<Bool>;
}