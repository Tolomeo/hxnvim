package nvim.type.vim.lsp.buf.hover;

/**
	```lua
	(class) vim.lsp.buf.hover.Opts
	```
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts._update_win: integer?
		```
	**/
	@:optional
	var _update_win : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.anchor_bias: ('above'|'auto'|'below')?
		```
		
		---
		
		
		 Adjusts placement relative to cursor.
		 - "auto": place window based on which side of the cursor has more lines
		 - "above": place the window above the cursor unless there are not enough lines
		   to display the full window height.
		 - "below": place the window below the cursor unless there are not enough lines
		   to display the full window height.
		 (default: `'auto'`)
	**/
	@:optional
	var anchor_bias : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.border: (string|(string|[string, string])[])?
		```
		
		---
		
		override `border`
	**/
	@:optional
	var border : Null<haxe.extern.EitherType<String, Array<Dynamic>>>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.close_events: table?
		```
		
		---
		
		
		 List of events that closes the floating window
	**/
	@:optional
	var close_events : Null<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.focus: boolean?
		```
		
		---
		
		
		 If `true`, and if {focusable} is also `true`, focus an existing floating
		 window with the same {focus_id}
		 (default: `true`)
	**/
	@:optional
	var focus : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.focus_id: string?
		```
		
		---
		
		
		 If a popup with this id is opened, then focus it
	**/
	@:optional
	var focus_id : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.focusable: boolean?
		```
		
		---
		
		
		 Make float focusable.
		 (default: `true`)
	**/
	@:optional
	var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.height: integer?
		```
		
		---
		
		
		 Height of floating window
	**/
	@:optional
	var height : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.max_height: integer?
		```
		
		---
		
		
		 Maximal height of floating window
	**/
	@:optional
	var max_height : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.max_width: integer?
		```
		
		---
		
		
		 Maximal width of floating window
	**/
	@:optional
	var max_width : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.offset_x: integer?
		```
		
		---
		
		
		 offset to add to `col`
	**/
	@:optional
	var offset_x : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.offset_y: integer?
		```
		
		---
		
		
		 offset to add to `row`
	**/
	@:optional
	var offset_y : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.relative: ('cursor'|'editor'|'mouse')?
		```
		
		---
		
		
		 (default: `'cursor'`)
	**/
	@:optional
	var relative : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.silent: boolean?
		```
	**/
	@:optional
	var silent : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.title: (string|[string, string][])?
		```
	**/
	@:optional
	var title : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.title_pos: ('center'|'left'|'right')?
		```
	**/
	@:optional
	var title_pos : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.width: integer?
		```
		
		---
		
		
		 Width of floating window
	**/
	@:optional
	var width : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.wrap: boolean?
		```
		
		---
		
		
		 Wrap long lines
		 (default: `true`)
	**/
	@:optional
	var wrap : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.wrap_at: integer?
		```
		
		---
		
		
		 Character to wrap at for computing height when wrap is enabled
	**/
	@:optional
	var wrap_at : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.zindex: integer?
		```
		
		---
		
		override `zindex`, defaults to 50
	**/
	@:optional
	var zindex : Null<Int>;
}