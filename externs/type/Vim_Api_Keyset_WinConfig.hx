package externs.type;

/**
	```lua
	(class) vim.api.keyset.win_config
	```
**/
@:structInit extern class Vim_Api_Keyset_WinConfig {
	/**
		```lua
		(field) vim.api.keyset.win_config.anchor: ('NE'|'NW'|'SE'|'SW')?
		```
	**/
	extern var anchor : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.border: ('double'|'none'|'rounded'|'shadow'|'single'|'solid'|string[])?
		```
	**/
	extern var border : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.bufpos: integer[]?
		```
	**/
	extern var bufpos : Null<Array<Int>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.col: number?
		```
	**/
	extern var col : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.external: boolean?
		```
	**/
	extern var external : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.fixed: boolean?
		```
	**/
	extern var fixed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.focusable: boolean?
		```
	**/
	extern var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer: any
		```
	**/
	extern var footer : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer_pos: ('center'|'left'|'right')?
		```
	**/
	extern var footer_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.height: integer?
		```
	**/
	extern var height : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.hide: boolean?
		```
	**/
	extern var hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.mouse: boolean?
		```
	**/
	extern var mouse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.noautocmd: boolean?
		```
	**/
	extern var noautocmd : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.relative: ('cursor'|'editor'|'laststatus'|'mouse'|'tabline'|'win')?
		```
	**/
	extern var relative : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.row: number?
		```
	**/
	extern var row : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.split: ('above'|'below'|'left'|'right')?
		```
	**/
	extern var split : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.style: 'minimal'?
		```
	**/
	extern var style : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title: any
		```
	**/
	extern var title : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title_pos: ('center'|'left'|'right')?
		```
	**/
	extern var title_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.vertical: boolean?
		```
	**/
	extern var vertical : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.width: integer?
		```
	**/
	extern var width : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.win: integer?
		```
	**/
	extern var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.zindex: integer?
		```
	**/
	extern var zindex : Null<Int>;
}