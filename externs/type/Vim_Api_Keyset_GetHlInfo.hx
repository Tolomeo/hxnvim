package externs.type;

/**
	```lua
	(class) vim.api.keyset.get_hl_info
	```
**/
extern class Vim_Api_Keyset_GetHlInfo {
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.altfont: true?
		```
	**/
	extern var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bg: integer?
		```
	**/
	extern var bg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.blend: integer?
		```
	**/
	extern var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.bold: true?
		```
	**/
	extern var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.cterm: (vim.api.keyset.hl_info.cterm)?
		```
	**/
	extern var cterm : Null<externs.type.Vim_Api_Keyset_HlInfo_Cterm>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermbg: integer?
		```
	**/
	extern var ctermbg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.ctermfg: integer?
		```
	**/
	extern var ctermfg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.default: true?
		```
	**/
	@:native("default")
	extern var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.fg: integer?
		```
	**/
	extern var fg : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.italic: true?
		```
	**/
	extern var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.link: string?
		```
	**/
	extern var link : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.nocombine: true?
		```
	**/
	extern var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.reverse: true?
		```
	**/
	extern var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.sp: integer?
		```
	**/
	extern var sp : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.standout: true?
		```
	**/
	extern var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.strikethrough: true?
		```
	**/
	extern var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.undercurl: true?
		```
	**/
	extern var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdashed: true?
		```
	**/
	extern var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdotted: true?
		```
	**/
	extern var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underdouble: true?
		```
	**/
	extern var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_hl_info.underline: true?
		```
	**/
	extern var underline : Null<Bool>;
}