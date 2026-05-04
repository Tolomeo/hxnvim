package externs.type;

/**
	```lua
	(class) vim.lsp.buf.hover.Opts
	```
**/
extern class Vim_Lsp_Buf_Hover_Opts {
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts._update_win: integer?
		```
	**/
	extern var _update_win : Null<Int>;
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
	extern var anchor_bias : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.border: (string|(string|[string, string])[])?
		```
		
		---
		
		override `border`
	**/
	extern var border : Null<haxe.extern.EitherType<String, Array<Dynamic>>>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.close_events: table?
		```
		
		---
		
		
		 List of events that closes the floating window
	**/
	extern var close_events : Null<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.focus: boolean?
		```
		
		---
		
		
		 If `true`, and if {focusable} is also `true`, focus an existing floating
		 window with the same {focus_id}
		 (default: `true`)
	**/
	extern var focus : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.focus_id: string?
		```
		
		---
		
		
		 If a popup with this id is opened, then focus it
	**/
	extern var focus_id : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.focusable: boolean?
		```
		
		---
		
		
		 Make float focusable.
		 (default: `true`)
	**/
	extern var focusable : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.height: integer?
		```
		
		---
		
		
		 Height of floating window
	**/
	extern var height : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.max_height: integer?
		```
		
		---
		
		
		 Maximal height of floating window
	**/
	extern var max_height : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.max_width: integer?
		```
		
		---
		
		
		 Maximal width of floating window
	**/
	extern var max_width : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.offset_x: integer?
		```
		
		---
		
		
		 offset to add to `col`
	**/
	extern var offset_x : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.offset_y: integer?
		```
		
		---
		
		
		 offset to add to `row`
	**/
	extern var offset_y : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.relative: ('cursor'|'editor'|'mouse')?
		```
		
		---
		
		
		 (default: `'cursor'`)
	**/
	extern var relative : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.silent: boolean?
		```
	**/
	extern var silent : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.title: (string|[string, string][])?
		```
	**/
	extern var title : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.title_pos: ('center'|'left'|'right')?
		```
	**/
	extern var title_pos : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.width: integer?
		```
		
		---
		
		
		 Width of floating window
	**/
	extern var width : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.wrap: boolean?
		```
		
		---
		
		
		 Wrap long lines
		 (default: `true`)
	**/
	extern var wrap : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.wrap_at: integer?
		```
		
		---
		
		
		 Character to wrap at for computing height when wrap is enabled
	**/
	extern var wrap_at : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.hover.Opts.zindex: integer?
		```
		
		---
		
		override `zindex`, defaults to 50
	**/
	extern var zindex : Null<Int>;
}