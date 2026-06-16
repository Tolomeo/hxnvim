package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.highlight
	```
**/
@:structInit class Highlight {
	/**
		```lua
		(field) vim.api.keyset.highlight.altfont: boolean?
		```
	**/
	@:optional
	var altfont : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.background: (string|integer)?
		```
	**/
	@:optional
	var background : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg: (string|integer)?
		```
	**/
	@:optional
	var bg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bg_indexed: boolean?
		```
	**/
	@:optional
	var bg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.blend: integer?
		```
	**/
	@:optional
	var blend : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.highlight.bold: boolean?
		```
	**/
	@:optional
	var bold : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.cterm: (string|integer)?
		```
	**/
	@:optional
	var cterm : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermbg: (string|integer)?
		```
	**/
	@:optional
	var ctermbg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.ctermfg: (string|integer)?
		```
	**/
	@:optional
	var ctermfg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.default: boolean?
		```
	**/
	@:optional
	@:native("default")
	var default_ : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fallback: boolean?
		```
	**/
	@:optional
	var fallback : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg: (string|integer)?
		```
	**/
	@:optional
	var fg : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.fg_indexed: boolean?
		```
	**/
	@:optional
	var fg_indexed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.force: boolean?
		```
	**/
	@:optional
	var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.foreground: (string|integer)?
		```
	**/
	@:optional
	var foreground : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.global_link: (string|integer)?
		```
	**/
	@:optional
	var global_link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.italic: boolean?
		```
	**/
	@:optional
	var italic : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.link: (string|integer)?
		```
	**/
	@:optional
	var link : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.nocombine: boolean?
		```
	**/
	@:optional
	var nocombine : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.reverse: boolean?
		```
	**/
	@:optional
	var reverse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.sp: (string|integer)?
		```
	**/
	@:optional
	var sp : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.special: (string|integer)?
		```
	**/
	@:optional
	var special : Null<haxe.extern.EitherType<Int, String>>;
	/**
		```lua
		(field) vim.api.keyset.highlight.standout: boolean?
		```
	**/
	@:optional
	var standout : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.strikethrough: boolean?
		```
	**/
	@:optional
	var strikethrough : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.undercurl: boolean?
		```
	**/
	@:optional
	var undercurl : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdashed: boolean?
		```
	**/
	@:optional
	var underdashed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdotted: boolean?
		```
	**/
	@:optional
	var underdotted : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underdouble: boolean?
		```
	**/
	@:optional
	var underdouble : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.underline: boolean?
		```
	**/
	@:optional
	var underline : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.highlight.url: string?
		```
	**/
	@:optional
	var url : Null<String>;
}