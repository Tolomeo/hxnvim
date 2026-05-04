package externs.type;

/**
	```lua
	(class) vim.api.keyset.eval_statusline
	```
**/
extern class Vim_Api_Keyset_EvalStatusline {
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.fillchar: string?
		```
	**/
	extern var fillchar : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.highlights: boolean?
		```
	**/
	extern var highlights : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.maxwidth: integer?
		```
	**/
	extern var maxwidth : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_statuscol_lnum: integer?
		```
	**/
	extern var use_statuscol_lnum : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_tabline: boolean?
		```
	**/
	extern var use_tabline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.use_winbar: boolean?
		```
	**/
	extern var use_winbar : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.eval_statusline.winid: integer?
		```
	**/
	extern var winid : Null<Int>;
}