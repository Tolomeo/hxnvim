package externs.type;

/**
	```lua
	(class) vim.api.keyset.highlight
	```
**/
@:native("vim.api.keyset.highlight") extern class Vim_Api_Keyset_Highlight {
	/**
		```lua
		(field) vim.api.keyset.highlight.altfont: boolean?
		```
	**/
	extern var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.background: (string|integer)?
		```
	**/
	extern var background : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg: (string|integer)?
		```
	**/
	extern var bg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg_indexed: boolean?
		```
	**/
	extern var bg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.blend: integer?
		```
	**/
	extern var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bold: boolean?
		```
	**/
	extern var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.cterm: (string|integer)?
		```
	**/
	extern var cterm : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermbg: (string|integer)?
		```
	**/
	extern var ctermbg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermfg: (string|integer)?
		```
	**/
	extern var ctermfg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.default: boolean?
		```
	**/
	@:native("default")
	extern var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fallback: boolean?
		```
	**/
	extern var fallback : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg: (string|integer)?
		```
	**/
	extern var fg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg_indexed: boolean?
		```
	**/
	extern var fg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.force: boolean?
		```
	**/
	extern var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.foreground: (string|integer)?
		```
	**/
	extern var foreground : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.global_link: (string|integer)?
		```
	**/
	extern var global_link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.italic: boolean?
		```
	**/
	extern var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.link: (string|integer)?
		```
	**/
	extern var link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.nocombine: boolean?
		```
	**/
	extern var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.reverse: boolean?
		```
	**/
	extern var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.sp: (string|integer)?
		```
	**/
	extern var sp : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.special: (string|integer)?
		```
	**/
	extern var special : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.standout: boolean?
		```
	**/
	extern var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.strikethrough: boolean?
		```
	**/
	extern var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.undercurl: boolean?
		```
	**/
	extern var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdashed: boolean?
		```
	**/
	extern var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdotted: boolean?
		```
	**/
	extern var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdouble: boolean?
		```
	**/
	extern var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underline: boolean?
		```
	**/
	extern var underline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.url: string?
		```
	**/
	extern var url : Null<String>;
}