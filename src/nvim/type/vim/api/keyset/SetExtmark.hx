package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.set_extmark
	```
**/
@:structInit class SetExtmark {
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal: string?
		```
	**/
	@:optional
	var conceal : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.conceal_lines: string?
		```
	**/
	@:optional
	var conceal_lines : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.cursorline_hl_group: (string|integer)?
		```
	**/
	@:optional
	var cursorline_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_col: integer?
		```
	**/
	@:optional
	var end_col : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_line: integer?
		```
	**/
	@:optional
	var end_line : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_right_gravity: boolean?
		```
	**/
	@:optional
	var end_right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.end_row: integer?
		```
	**/
	@:optional
	var end_row : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ephemeral: boolean?
		```
	**/
	@:optional
	var ephemeral : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_eol: boolean?
		```
	**/
	@:optional
	var hl_eol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_group: any
		```
	**/
	@:optional
	var hl_group : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.hl_mode: string?
		```
	**/
	@:optional
	var hl_mode : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.id: integer?
		```
	**/
	@:optional
	var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.invalidate: boolean?
		```
	**/
	@:optional
	var invalidate : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.line_hl_group: (string|integer)?
		```
	**/
	@:optional
	var line_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.number_hl_group: (string|integer)?
		```
	**/
	@:optional
	var number_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.priority: integer?
		```
	**/
	@:optional
	var priority : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.right_gravity: boolean?
		```
	**/
	@:optional
	var right_gravity : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.scoped: boolean?
		```
	**/
	@:optional
	var scoped : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_hl_group: (string|integer)?
		```
	**/
	@:optional
	var sign_hl_group : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.sign_text: string?
		```
	**/
	@:optional
	var sign_text : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.spell: boolean?
		```
	**/
	@:optional
	var spell : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.strict: boolean?
		```
	**/
	@:optional
	var strict : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.ui_watched: boolean?
		```
	**/
	@:optional
	var ui_watched : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.undo_restore: boolean?
		```
	**/
	@:optional
	var undo_restore : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.url: string?
		```
	**/
	@:optional
	var url : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines: any[]?
		```
	**/
	@:optional
	var virt_lines : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_above: boolean?
		```
	**/
	@:optional
	var virt_lines_above : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_leftcol: boolean?
		```
	**/
	@:optional
	var virt_lines_leftcol : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_lines_overflow: string?
		```
	**/
	@:optional
	var virt_lines_overflow : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text: any[]?
		```
	**/
	@:optional
	var virt_text : Null<Array<Any>>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_hide: boolean?
		```
	**/
	@:optional
	var virt_text_hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_pos: string?
		```
	**/
	@:optional
	var virt_text_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_repeat_linebreak: boolean?
		```
	**/
	@:optional
	var virt_text_repeat_linebreak : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.set_extmark.virt_text_win_col: integer?
		```
	**/
	@:optional
	var virt_text_win_col : Null<Int>;
}