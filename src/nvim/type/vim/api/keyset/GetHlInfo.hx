package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_hl_info
	```
**/
@:structInit class GetHlInfo {
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.altfont: true?
		```
	**/
	@:optional
	var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bg: integer?
		```
	**/
	@:optional
	var bg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.blend: integer?
		```
	**/
	@:optional
	var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bold: true?
		```
	**/
	@:optional
	var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.cterm: (vim.api.keyset.hl_info.cterm)?
		```
	**/
	@:optional
	var cterm : Null<nvim.type.vim.api.keyset.hl_info.Cterm>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermbg: integer?
		```
	**/
	@:optional
	var ctermbg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermfg: integer?
		```
	**/
	@:optional
	var ctermfg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.default: true?
		```
	**/
	@:optional
	@:native("default")
	var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.fg: integer?
		```
	**/
	@:optional
	var fg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.italic: true?
		```
	**/
	@:optional
	var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.link: string?
		```
	**/
	@:optional
	var link : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.nocombine: true?
		```
	**/
	@:optional
	var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.reverse: true?
		```
	**/
	@:optional
	var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.sp: integer?
		```
	**/
	@:optional
	var sp : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.standout: true?
		```
	**/
	@:optional
	var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.strikethrough: true?
		```
	**/
	@:optional
	var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.undercurl: true?
		```
	**/
	@:optional
	var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdashed: true?
		```
	**/
	@:optional
	var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdotted: true?
		```
	**/
	@:optional
	var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdouble: true?
		```
	**/
	@:optional
	var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underline: true?
		```
	**/
	@:optional
	var underline : Null<Bool>;
}