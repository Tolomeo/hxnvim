package externs.type;

/**
	```lua
	(class) vim.api.keyset.set_extmark
	```
**/
@:native("vim.api.keyset.set_extmark") extern class Vim_Api_Keyset_SetExtmark {
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal: string?
		```
	**/
	extern var conceal : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal_lines: string?
		```
	**/
	extern var conceal_lines : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.cursorline_hl_group: (string|integer)?
		```
	**/
	extern var cursorline_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_col: integer?
		```
	**/
	extern var end_col : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_line: integer?
		```
	**/
	extern var end_line : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_right_gravity: boolean?
		```
	**/
	extern var end_right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_row: integer?
		```
	**/
	extern var end_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ephemeral: boolean?
		```
	**/
	extern var ephemeral : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_eol: boolean?
		```
	**/
	extern var hl_eol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_group: any
		```
	**/
	extern var hl_group : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_mode: string?
		```
	**/
	extern var hl_mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.id: integer?
		```
	**/
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.invalidate: boolean?
		```
	**/
	extern var invalidate : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.line_hl_group: (string|integer)?
		```
	**/
	extern var line_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.number_hl_group: (string|integer)?
		```
	**/
	extern var number_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.priority: integer?
		```
	**/
	extern var priority : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.right_gravity: boolean?
		```
	**/
	extern var right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.scoped: boolean?
		```
	**/
	extern var scoped : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_hl_group: (string|integer)?
		```
	**/
	extern var sign_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_text: string?
		```
	**/
	extern var sign_text : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.spell: boolean?
		```
	**/
	extern var spell : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.strict: boolean?
		```
	**/
	extern var strict : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ui_watched: boolean?
		```
	**/
	extern var ui_watched : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.undo_restore: boolean?
		```
	**/
	extern var undo_restore : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.url: string?
		```
	**/
	extern var url : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines: any[]?
		```
	**/
	extern var virt_lines : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_above: boolean?
		```
	**/
	extern var virt_lines_above : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_leftcol: boolean?
		```
	**/
	extern var virt_lines_leftcol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_overflow: string?
		```
	**/
	extern var virt_lines_overflow : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text: any[]?
		```
	**/
	extern var virt_text : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_hide: boolean?
		```
	**/
	extern var virt_text_hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_pos: string?
		```
	**/
	extern var virt_text_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_repeat_linebreak: boolean?
		```
	**/
	extern var virt_text_repeat_linebreak : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_win_col: integer?
		```
	**/
	extern var virt_text_win_col : Null<Int>;
}