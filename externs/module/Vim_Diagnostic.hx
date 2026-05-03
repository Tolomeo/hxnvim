package externs.module;

@:private extern class Severity {
	extern var E : externs.type.Vim_Diagnostic_Severity;
	extern var ERROR : externs.type.Vim_Diagnostic_Severity;
	extern var HINT : externs.type.Vim_Diagnostic_Severity;
	extern var I : externs.type.Vim_Diagnostic_Severity;
	extern var INFO : externs.type.Vim_Diagnostic_Severity;
	extern var N : externs.type.Vim_Diagnostic_Severity;
	extern var W : externs.type.Vim_Diagnostic_Severity;
	extern var WARN : externs.type.Vim_Diagnostic_Severity;
}

@:private extern class Handlers {

}

@:native("vim.diagnostic") extern class Vim_Diagnostic {
	/**
		```lua
		function M.config(opts?: vim.diagnostic.Opts, namespace?: integer)
		  -> (vim.diagnostic.Opts)?
		```
		
		---
		
		 Configure diagnostic options globally or for a specific diagnostic
		 namespace.
		
		 Configuration can be specified globally, per-namespace, or ephemerally
		 (i.e. only for a single call to |vim.diagnostic.set()| or
		 |vim.diagnostic.show()|). Ephemeral configuration has highest priority,
		 followed by namespace configuration, and finally global configuration.
		
		 For example, if a user enables virtual text globally with
		
		 ```lua
		 vim.diagnostic.config({ virtual_text = true })
		 ```
		
		 and a diagnostic producer sets diagnostics with
		
		 ```lua
		 vim.diagnostic.set(ns, 0, diagnostics, { virtual_text = false })
		 ```
		
		 then virtual text will not be enabled for those diagnostics.
		
		@*param* `opts` — When omitted or `nil`, retrieve the current
		
		       configuration. Otherwise, a configuration table (see |vim.diagnostic.Opts|).
		
		@*param* `namespace` — Update the options for the given namespace.
		
		                          When omitted, update the global diagnostic options.
		
		@*return* — : Current diagnostic config if {opts} is omitted.
	**/
	extern static function config(opts:Null<externs.type.Vim_Diagnostic_Opts>, namespace:Null<Int>):Null<externs.type.Vim_Diagnostic_Opts>;
	/**
		```lua
		function M.count(bufnr?: integer, opts?: vim.diagnostic.GetOpts)
		  -> table
		```
		
		---
		
		 Get current diagnostics count.
		
		@*param* `bufnr` — Buffer number to get diagnostics from. Use 0 for
		
		                      current buffer or nil for all buffers.
		
		@*return* — : Table with actually present severity values as keys
		
		                (see |diagnostic-severity|) and integer counts as values.
	**/
	extern static function count(?bufnr:Int, ?opts:externs.type.Vim_Diagnostic_GetOpts):lua.Table.AnyTable;
	/**
		```lua
		function M.disable(bufnr: any, namespace: any)
		```
	**/
	@:deprecated
	extern static function disable(bufnr:Dynamic, namespace:Dynamic):Dynamic;
	/**
		```lua
		function M.enable(enable: boolean|nil, filter?: vim.diagnostic.Filter)
		```
		
		---
		
		 Enables or disables diagnostics.
		
		 To "toggle", pass the inverse of `is_enabled()`:
		
		 ```lua
		 vim.diagnostic.enable(not vim.diagnostic.is_enabled())
		 ```
		
		@*param* `enable` — true/nil to enable, false to disable
	**/
	extern static function enable(enable:haxe.extern.EitherType<Bool, Void>, filter:Null<externs.type.Vim_Diagnostic_Filter>):Dynamic;
	/**
		```lua
		function M.fromqflist(list: table[])
		  -> vim.Diagnostic[]
		```
		
		---
		
		 Convert a list of quickfix items to a list of diagnostics.
		
		@*param* `list` — List of quickfix items from |getqflist()| or |getloclist()|.
	**/
	extern static function fromqflist(list:Array<lua.Table.AnyTable>):Array<externs.type.Vim_Diagnostic>;
	/**
		```lua
		function M.get(bufnr?: integer, opts?: vim.diagnostic.GetOpts)
		  -> vim.Diagnostic[]
		```
		
		---
		
		 Get current diagnostics.
		
		 Modifying diagnostics in the returned table has no effect.
		 To set diagnostics in a buffer, use |vim.diagnostic.set()|.
		
		@*param* `bufnr` — Buffer number to get diagnostics from. Use 0 for
		
		                      current buffer or nil for all buffers.
		
		@*return* — : Fields `bufnr`, `end_lnum`, `end_col`, and `severity`
		
		                           are guaranteed to be present.
	**/
	extern static function get(bufnr:Null<Int>, ?opts:externs.type.Vim_Diagnostic_GetOpts):Array<externs.type.Vim_Diagnostic>;
	/**
		```lua
		function M.get_namespace(namespace: integer)
		  -> vim.diagnostic.NS
		```
		
		---
		
		 Get namespace metadata.
		
		@*param* `namespace` — Diagnostic namespace
		
		@*return* — : Namespace metadata
	**/
	extern static function get_namespace(namespace:Int):externs.type.Vim_Diagnostic_NS;
	/**
		```lua
		function M.get_namespaces()
		  -> table<integer, vim.diagnostic.NS>
		```
		
		---
		
		 Get current diagnostic namespaces.
		
		@*return* — : List of active diagnostic namespaces |vim.diagnostic|.
	**/
	extern static function get_namespaces():lua.Table<Int, externs.type.Vim_Diagnostic_NS>;
	/**
		```lua
		function M.get_next(opts?: vim.diagnostic.JumpOpts)
		  -> (vim.Diagnostic)?
		```
		
		---
		
		 Get the next diagnostic closest to the cursor position.
		
		@*return* — : Next diagnostic
	**/
	extern static function get_next(?opts:externs.type.Vim_Diagnostic_JumpOpts):Null<externs.type.Vim_Diagnostic>;
	/**
		```lua
		function M.get_next_pos(opts?: vim.diagnostic.JumpOpts)
		  -> table|false
		```
		
		---
		
		 Return the position of the next diagnostic in the current buffer.
		
		@*return* — : Next diagnostic position as a `(row, col)` tuple or false if no next
		
		                      diagnostic.
		
		```lua
		return #1:
		    | false
		```
	**/
	@:deprecated
	extern static function get_next_pos(?opts:externs.type.Vim_Diagnostic_JumpOpts):haxe.extern.EitherType<lua.Table.AnyTable, Bool>;
	/**
		```lua
		function M.get_prev(opts?: vim.diagnostic.JumpOpts)
		  -> (vim.Diagnostic)?
		```
		
		---
		
		 Get the previous diagnostic closest to the cursor position.
		
		@*return* — : Previous diagnostic
	**/
	extern static function get_prev(?opts:externs.type.Vim_Diagnostic_JumpOpts):Null<externs.type.Vim_Diagnostic>;
	/**
		```lua
		function M.get_prev_pos(opts?: vim.diagnostic.JumpOpts)
		  -> table|false
		```
		
		---
		
		 Return the position of the previous diagnostic in the current buffer.
		
		@*return* — : Previous diagnostic position as a `(row, col)` tuple
		
		                     or `false` if there is no prior diagnostic.
		
		```lua
		return #1:
		    | false
		```
	**/
	@:deprecated
	extern static function get_prev_pos(?opts:externs.type.Vim_Diagnostic_JumpOpts):haxe.extern.EitherType<lua.Table.AnyTable, Bool>;
	/**
		```lua
		function M.goto_next(opts?: vim.diagnostic.JumpOpts)
		```
		
		---
		
		 Move to the next diagnostic.
	**/
	@:deprecated
	extern static function goto_next(?opts:externs.type.Vim_Diagnostic_JumpOpts):Dynamic;
	/**
		```lua
		function M.goto_prev(opts?: vim.diagnostic.JumpOpts)
		```
		
		---
		
		 Move to the previous diagnostic in the current buffer.
	**/
	@:deprecated
	extern static function goto_prev(?opts:externs.type.Vim_Diagnostic_JumpOpts):Dynamic;
	/**
		```lua
		(global) vim.diagnostic.handlers: table<string, vim.diagnostic.Handler>
		```
		
		---
		
		 @nodoc
	**/
	extern var handlers : Handlers;
	/**
		```lua
		function M.hide(namespace?: integer, bufnr?: integer)
		```
		
		---
		
		 Hide currently displayed diagnostics.
		
		 This only clears the decorations displayed in the buffer. Diagnostics can
		 be redisplayed with |vim.diagnostic.show()|. To completely remove
		 diagnostics, use |vim.diagnostic.reset()|.
		
		 To hide diagnostics and prevent them from re-displaying, use
		 |vim.diagnostic.enable()|.
		
		@*param* `namespace` — Diagnostic namespace. When omitted, hide
		
		                          diagnostics from all namespaces.
		
		@*param* `bufnr` — Buffer number, or 0 for current buffer. When
		
		                      omitted, hide diagnostics in all buffers.
	**/
	extern static function hide(namespace:Null<Int>, bufnr:Null<Int>):Dynamic;
	/**
		```lua
		function M.is_disabled(bufnr: any, namespace: any)
		  -> boolean
		```
	**/
	@:deprecated
	extern static function is_disabled(bufnr:Dynamic, namespace:Dynamic):Dynamic;
	/**
		```lua
		function M.is_enabled(filter?: vim.diagnostic.Filter)
		  -> boolean
		```
		
		---
		
		 Check whether diagnostics are enabled.
		
		 @since 12
	**/
	extern static function is_enabled(filter:Null<externs.type.Vim_Diagnostic_Filter>):Bool;
	/**
		```lua
		function M.jump(opts: vim.diagnostic.JumpOpts)
		  -> (vim.Diagnostic)?
		```
		
		---
		
		 Move to a diagnostic.
		
		@*return* — The diagnostic that was moved to.
	**/
	extern static function jump(opts:externs.type.Vim_Diagnostic_JumpOpts):Null<externs.type.Vim_Diagnostic>;
	/**
		```lua
		function M.match(str: string, pat: string, groups: string[], severity_map: table, defaults?: table)
		  -> (vim.Diagnostic)?
		```
		
		---
		
		 Parse a diagnostic from a string.
		
		 For example, consider a line of output from a linter:
		
		 ```
		 WARNING filename:27:3: Variable 'foo' does not exist
		 ```
		
		 This can be parsed into |vim.Diagnostic| structure with:
		
		 ```lua
		 local s = "WARNING filename:27:3: Variable 'foo' does not exist"
		 local pattern = "^(%w+) %w+:(%d+):(%d+): (.+)$"
		 local groups = { "severity", "lnum", "col", "message" }
		 vim.diagnostic.match(s, pattern, groups, { WARNING = vim.diagnostic.WARN })
		 ```
		
		@*param* `str` — String to parse diagnostics from.
		
		@*param* `pat` — Lua pattern with capture groups.
		
		@*param* `groups` — List of fields in a |vim.Diagnostic| structure to
		
		                    associate with captures from {pat}.
		
		@*param* `severity_map` — A table mapping the severity field from {groups}
		
		                          with an item from |vim.diagnostic.severity|.
		
		@*param* `defaults` — Table of default values for any fields not listed in {groups}.
		
		                       When omitted, numeric values default to 0 and "severity" defaults to
		                       ERROR.
		
		@*return* — : |vim.Diagnostic| structure or `nil` if {pat} fails to match {str}.
	**/
	extern static function match(str:String, pat:String, groups:Array<String>, severity_map:lua.Table.AnyTable, defaults:Null<lua.Table.AnyTable>):Null<externs.type.Vim_Diagnostic>;
	/**
		```lua
		function M.open_float(opts?: vim.diagnostic.Opts.Float, ...any)
		  -> float_bufnr: integer?
		  2. winid: integer?
		```
		
		---
		
		 Show diagnostics in a floating window.
	**/
	extern static function open_float(opts:Null<externs.type.Vim_Diagnostic_Opts_Float>, ___:haxe.Rest<Dynamic>):vim._internal.Multireturn<Null<Int>, Null<Int>>;
	/**
		```lua
		function M.reset(namespace?: integer, bufnr?: integer)
		```
		
		---
		
		 Remove all diagnostics from the given namespace.
		
		 Unlike |vim.diagnostic.hide()|, this function removes all saved
		 diagnostics. They cannot be redisplayed using |vim.diagnostic.show()|. To
		 simply remove diagnostic decorations in a way that they can be
		 re-displayed, use |vim.diagnostic.hide()|.
		
		@*param* `namespace` — Diagnostic namespace. When omitted, remove
		
		                          diagnostics from all namespaces.
		
		@*param* `bufnr` — Remove diagnostics for the given buffer. When omitted,
		
		                     diagnostics are removed for all buffers.
	**/
	extern static function reset(namespace:Null<Int>, bufnr:Null<Int>):Dynamic;
	/**
		```lua
		function M.set(namespace: integer, bufnr: integer, diagnostics: vim.Diagnostic[], opts?: vim.diagnostic.Opts)
		```
		
		---
		
		 Set diagnostics for the given namespace and buffer.
		
		@*param* `namespace` — The diagnostic namespace
		
		@*param* `bufnr` — Buffer number
		
		@*param* `opts` — Display options to pass to |vim.diagnostic.show()|
	**/
	extern static function set(namespace:Int, bufnr:Int, diagnostics:Array<externs.type.Vim_Diagnostic>, ?opts:externs.type.Vim_Diagnostic_Opts):Dynamic;
	/**
		```lua
		function M.setloclist(opts?: vim.diagnostic.setloclist.Opts)
		```
		
		---
		
		 Add buffer diagnostics to the location list.
	**/
	extern static function setloclist(?opts:externs.type.Vim_Diagnostic_Setloclist_Opts):Dynamic;
	/**
		```lua
		function M.setqflist(opts?: vim.diagnostic.setqflist.Opts)
		```
		
		---
		
		 Add all diagnostics to the quickfix list.
	**/
	extern static function setqflist(?opts:externs.type.Vim_Diagnostic_Setqflist_Opts):Dynamic;
	/**
		```lua
		(global) vim.diagnostic.severity: enum vim.diagnostic.Severity
		```
	**/
	extern var severity : Severity;
	/**
		```lua
		function M.show(namespace?: integer, bufnr?: integer, diagnostics?: vim.Diagnostic[], opts?: vim.diagnostic.Opts)
		```
		
		---
		
		 Display diagnostics for the given namespace and buffer.
		
		@*param* `namespace` — Diagnostic namespace. When omitted, show
		
		                          diagnostics from all namespaces.
		
		@*param* `bufnr` — Buffer number, or 0 for current buffer. When omitted, show
		
		                      diagnostics in all buffers.
		
		@*param* `diagnostics` — The diagnostics to display. When omitted, use the
		
		                             saved diagnostics for the given namespace and
		                             buffer. This can be used to display a list of diagnostics
		                             without saving them or to display only a subset of
		                             diagnostics. May not be used when {namespace}
		                             or {bufnr} is nil.
		
		@*param* `opts` — Display options.
	**/
	extern static function show(namespace:Null<Int>, bufnr:Null<Int>, diagnostics:Null<Array<externs.type.Vim_Diagnostic>>, ?opts:externs.type.Vim_Diagnostic_Opts):Dynamic;
	/**
		```lua
		function M.toqflist(diagnostics: vim.Diagnostic[])
		  -> table[]
		```
		
		---
		
		 Convert a list of diagnostics to a list of quickfix items that can be
		 passed to |setqflist()| or |setloclist()|.
		
		@*return* — : Quickfix list items |setqflist-what|
	**/
	extern static function toqflist(diagnostics:Array<externs.type.Vim_Diagnostic>):Array<lua.Table.AnyTable>;
}