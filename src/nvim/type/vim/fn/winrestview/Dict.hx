package nvim.type.vim.fn.winrestview;

/**
	```lua
	(class) vim.fn.winrestview.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.winrestview.dict.col: integer?
		```
	**/
	@:optional
	var col : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.coladd: integer?
		```
	**/
	@:optional
	var coladd : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.curswant: integer?
		```
	**/
	@:optional
	var curswant : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.leftcol: integer?
		```
	**/
	@:optional
	var leftcol : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.lnum: integer?
		```
	**/
	@:optional
	var lnum : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.skipcol: integer?
		```
	**/
	@:optional
	var skipcol : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.topfill: integer?
		```
	**/
	@:optional
	var topfill : Null<Int>;
	/**
		```lua
		(field) vim.fn.winrestview.dict.topline: integer?
		```
	**/
	@:optional
	var topline : Null<Int>;
}