package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.win_config
	```
**/
@:structInit class WinConfig {
	/**
		```lua
		(field) vim.api.keyset.win_config.anchor: ('NE'|'NW'|'SE'|'SW')?
		```
	**/
	@:optional
	var anchor : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.border: ('double'|'none'|'rounded'|'shadow'|'single'|'solid'|string[])?
		```
	**/
	@:optional
	var border : Null<haxe.extern.EitherType<String, Array<String>>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.bufpos: integer[]?
		```
	**/
	@:optional
	var bufpos : Null<Array<Int>>;
	/**
		```lua
		(field) vim.api.keyset.win_config.col: number?
		```
	**/
	@:optional
	var col : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.external: boolean?
		```
	**/
	@:optional
	var external : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.fixed: boolean?
		```
	**/
	@:optional
	var fixed : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.focusable: boolean?
		```
	**/
	@:optional
	var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer: any
		```
	**/
	@:optional
	var footer : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.footer_pos: ('center'|'left'|'right')?
		```
	**/
	@:optional
	var footer_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.height: integer?
		```
	**/
	@:optional
	var height : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.hide: boolean?
		```
	**/
	@:optional
	var hide : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.mouse: boolean?
		```
	**/
	@:optional
	var mouse : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.noautocmd: boolean?
		```
	**/
	@:optional
	var noautocmd : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.relative: ('cursor'|'editor'|'laststatus'|'mouse'|'tabline'|'win')?
		```
	**/
	@:optional
	var relative : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.row: number?
		```
	**/
	@:optional
	var row : Null<Float>;
	/**
		```lua
		(field) vim.api.keyset.win_config.split: ('above'|'below'|'left'|'right')?
		```
	**/
	@:optional
	var split : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.style: 'minimal'?
		```
	**/
	@:optional
	var style : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title: any
		```
	**/
	@:optional
	var title : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.win_config.title_pos: ('center'|'left'|'right')?
		```
	**/
	@:optional
	var title_pos : Null<String>;
	/**
		```lua
		(field) vim.api.keyset.win_config.vertical: boolean?
		```
	**/
	@:optional
	var vertical : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.win_config.width: integer?
		```
	**/
	@:optional
	var width : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.win: integer?
		```
	**/
	@:optional
	var win : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.win_config.zindex: integer?
		```
	**/
	@:optional
	var zindex : Null<Int>;
}