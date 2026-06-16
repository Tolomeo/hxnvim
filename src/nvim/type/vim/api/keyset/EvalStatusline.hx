package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.eval_statusline
	```
**/
@:structInit class EvalStatusline {
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.fillchar: string?
		```
	**/
	@:optional
	var fillchar : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.highlights: boolean?
		```
	**/
	@:optional
	var highlights : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.maxwidth: integer?
		```
	**/
	@:optional
	var maxwidth : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_statuscol_lnum: integer?
		```
	**/
	@:optional
	var use_statuscol_lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_tabline: boolean?
		```
	**/
	@:optional
	var use_tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_winbar: boolean?
		```
	**/
	@:optional
	var use_winbar : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.winid: integer?
		```
	**/
	@:optional
	var winid : Null<Int>;
}