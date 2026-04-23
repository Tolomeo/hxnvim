package vim;

@:native("vim") extern class Vim {
	/**
		```lua
		function vim.call(func: string, ...any)
		  -> any
		```
		
		---
		
		 Invokes |vim-function| or |user-function| {func} with arguments {...}.
		 See also |vim.fn|.
		 Equivalent to:
		
		 ```lua
		 vim.fn[func](file:///usr/local/share/nvim/runtime/lua/vim/_meta/%7B...%7D)
		 ```
	**/
	static function call():Void;
	/**
		```lua
		function vim.deep_equal(a: any, b: any)
		  -> boolean
		```
		
		---
		
		 Deep compare values for equality
		
		 Tables are compared recursively unless they both provide the `eq` metamethod.
		 All other types are compared using the equality `==` operator.
		
		@*param* `a` — First value
		
		@*param* `b` — Second value
		
		@*return* — `true` if values are equals, else `false`
	**/
	static function deep_equal():Void;
	/**
		```lua
		function vim.deepcopy(orig: <T:table>, noref?: boolean)
		  -> Table: <T:table>
		```
		
		---
		
		 Returns a deep copy of the given object. Non-table objects are copied as
		 in a typical Lua assignment, whereas table objects are copied recursively.
		 Functions are naively copied, so functions in the copied table point to the
		 same functions as those in the input table. Userdata and threads are not
		 copied and will throw an error.
		
		 Note: `noref=true` is much more performant on tables with unique table
		 fields, while `noref=false` is more performant on tables that reuse table
		 fields.
		
		@*param* `orig` — Table to copy
		
		 When `false` (default) a contained table is only copied once and all
		 references point to this single copy. When `true` every occurrence of a
		 table results in a new copy. This also means that a cyclic reference can
		 cause `deepcopy()` to fail.
		
		@*return* `Table` — of copied keys and (nested) values.
	**/
	static function deepcopy<T>():Void;
	/**
		```lua
		function vim.defaulttable(createfn?: fun(key: any):any)
		  -> table
		```
		
		---
		
		 Creates a table whose missing keys are provided by {createfn} (like Python's "defaultdict").
		
		 If {createfn} is `nil` it defaults to defaulttable() itself, so accessing nested keys creates
		 nested tables:
		
		 ```lua
		 local a = vim.defaulttable()
		 a.b.c = 1
		 ```
		
		@*param* `createfn` — Provides the value for a missing `key`.
		
		@*return* — Empty table with `__index` metamethod.
	**/
	static function defaulttable():Void;
	/**
		```lua
		function vim.defer_fn(fn: function, timeout: integer)
		  -> timer: table
		```
		
		---
		
		 Defers calling {fn} until {timeout} ms passes.
		
		 Use to do a one-shot timer that calls {fn}
		 Note: The {fn} is |vim.schedule_wrap()|ped automatically, so API functions are
		 safe to call.
		
		@*param* `fn` — Callback to call once `timeout` expires
		
		@*param* `timeout` — Number of milliseconds to wait before calling `fn`
		
		@*return* `timer` — luv timer object
	**/
	static function defer_fn():Void;
	/**
		```lua
		function vim.deprecate(name: string, alternative: string|nil, version: string, plugin: string|nil, backtrace: boolean|nil)
		  -> string|nil
		```
		
		---
		
		 Shows a deprecation message to the user.
		
		@*param* `name` — Deprecated feature (function, API, etc.).
		
		@*param* `alternative` — Suggested alternative feature.
		
		@*param* `version` — Version when the deprecated function will be removed.
		
		@*param* `plugin` — Name of the plugin that owns the deprecated feature.
		
		                              Defaults to "Nvim".
		
		@*param* `backtrace` — Prints backtrace. Defaults to true.
		
		
		@*return* — Deprecated message, or nil if no message was shown.
	**/
	static function deprecate():Void;
	/**
		```lua
		function vim.diff(a: string, b: string, opts?: vim.diff.Opts)
		  -> (string|integer[][])?
		```
		
		---
		
		 Run diff on strings {a} and {b}. Any indices returned by this function,
		 either directly or via callback arguments, are 1-based.
		
		 Examples:
		
		 ```lua
		 vim.diff('a\n', 'b\nc\n')
		 -- =>
		 -- @@ -1 +1,2 @@
		 -- -a
		 -- +b
		 -- +c
		
		 vim.diff('a\n', 'b\nc\n', {result_type = 'indices'})
		 -- =>
		 -- {
		 --   {1, 1, 1, 2}
		 -- }
		 ```
		
		@*param* `a` — First string to compare
		
		@*param* `b` — Second string to compare
		
		     See {opts.result_type}. `nil` if {opts.on_hunk} is given.
	**/
	static function diff():Void;
	/**
		```lua
		function vim.empty_dict()
		  -> table
		```
		
		---
		
		 <Docs described in |vim.empty_dict()| >
		 TODO: should be in vim.shared when vim.shared always uses nvim-lua
		
		---
		
		 Creates a special empty table (marked with a metatable), which Nvim
		 converts to an empty dictionary when translating Lua values to Vimscript
		 or API types. Nvim by default converts an empty table `{}` without this
		 metatable to an list/array.
		
		 Note: If numeric keys are present in the table, Nvim ignores the metatable
		 marker and converts the dict to a list/array anyway.
	**/
	private static function empty_dict():Void;
	/**
		```lua
		function vim.endswith(s: string, suffix: string)
		  -> boolean
		```
		
		---
		
		 Tests if `s` ends with `suffix`.
		
		@*param* `s` — String
		
		@*param* `suffix` — Suffix to match
		
		@*return* — `true` if `suffix` is a suffix of `s`
	**/
	static function endswith():Void;
	/**
		```lua
		function vim.funcref(viml_func_name: any)
		  -> unknown
		```
	**/
	private static function funcref():Void;
	/**
		```lua
		function vim.gsplit(s: string, sep: string, opts?: vim.gsplit.Opts)
		  -> fun():string?
		```
		
		---
		
		 Gets an |iterator| that splits a string at each instance of a separator, in "lazy" fashion
		 (as opposed to |vim.split()| which is "eager").
		
		 Example:
		
		 ```lua
		 for s in vim.gsplit(':aa::b:', ':', {plain=true}) do
		   print(s)
		 end
		 ```
		
		 If you want to also inspect the separator itself (instead of discarding it), use
		 |string.gmatch()|. Example:
		
		 ```lua
		 for word, num in ('foo111bar222'):gmatch('([^0-9]*)(%d*)') do
		   print(('word: %s num: %s'):format(word, num))
		 end
		 ```
		
		 @see |string.gmatch()|
		 @see |vim.split()|
		 @see |lua-pattern|s
		
		@*param* `s` — String to split
		
		@*param* `sep` — Separator or pattern
		
		@*param* `opts` — Keyword arguments |kwargs|:
		
		@*return* — : Iterator over the split components
		
		See:
		  * ~https~ ://www.lua.org/pil/20.2.html
		  * ~http~ ://lua-users.org/wiki/StringLibraryTutorial
	**/
	static function gsplit():Void;
	/**
		```lua
		function vim.iconv(str: string, from: string, to: string, opts: any)
		  -> string?
		```
		
		---
		
		 The result is a String, which is the text {str} converted from
		 encoding {from} to encoding {to}. When the conversion fails `nil` is
		 returned.  When some characters could not be converted they
		 are replaced with "?".
		 The encoding names are whatever the iconv() library function
		 can accept, see ":Man 3 iconv".
		
		@*param* `str` — Text to convert
		
		@*param* `from` — Encoding of {str}
		
		@*param* `to` — Target encoding
		
		@*return* — : Converted string if conversion succeeds, `nil` otherwise.
	**/
	static function iconv():Void;
	/**
		```lua
		function vim.in_fast_event()
		```
		
		---
		
		 Returns true if the code is executing as part of a "fast" event handler,
		 where most of the API is disabled. These are low-level events (e.g.
		 |lua-loop-callbacks|) which can be invoked whenever Nvim polls for input.
		 When this is `false` most API functions are callable (but may be subject
		 to other restrictions such as |textlock|).
	**/
	static function in_fast_event():Void;
	/**
		```lua
		(global) vim.inspect: fun(x: any, opts?: vim.inspect.Opts):string
		```
		
		---
		
		 Gets a human-readable representation of the given object.
		
		See:
		  * ~https~ ://github.com/kikito/inspect.lua
		  * ~https~ ://github.com/mpeterv/vinspect
		
		---
		
		```lua
		function (x: any, opts?: vim.inspect.Opts)
		  -> string
		```
	**/
	function inspect():Void;
	/**
		```lua
		function vim.inspect_pos(bufnr?: integer, row?: integer, col?: integer, filter?: vim._inspector.Filter)
		  -> { treesitter: table, syntax: table, extmarks: table, semantic_tokens: table, buffer: integer, col: integer, row: integer }
		```
		
		---
		
		Get all the items at a given buffer position.
		
		Can also be pretty-printed with `:Inspect!`. [:Inspect!](file:///usr/local/share/nvim/runtime/lua/vim)
		
		@*param* `bufnr` — defaults to the current buffer
		
		@*param* `row` — row to inspect, 0-based. Defaults to the row of the current cursor
		
		@*param* `col` — col to inspect, 0-based. Defaults to the col of the current cursor
		
		@*param* `filter` — Table with key-value pairs to filter the items
		
		@*return* — (table) a table with the following key-value pairs. Items are in "traversal order":
		
		               - treesitter: a list of treesitter captures
		               - syntax: a list of syntax groups
		               - semantic_tokens: a list of semantic tokens
		               - extmarks: a list of extmarks
		               - buffer: the buffer used to get the items
		               - row: the row used to get the items
		               - col: the col used to get the items
	**/
	static function inspect_pos():Void;
	/**
		```lua
		function vim.is_callable(f: any)
		  -> boolean
		```
		
		---
		
		 Returns true if object `f` can be called as a function.
		
		@*param* `f` — Any object
		
		@*return* — `true` if `f` is callable, else `false`
	**/
	static function is_callable():Void;
	/**
		```lua
		function vim.isarray(t?: table)
		  -> boolean
		```
		
		---
		
		 Tests if `t` is an "array": a table indexed _only_ by integers (potentially non-contiguous).
		
		 If the indexes start from 1 and are contiguous then the array is also a list. |vim.islist()|
		
		 Empty table `{}` is an array, unless it was created by |vim.empty_dict()| or returned as
		 a dict-like |API| or Vimscript result, for example from |rpcrequest()| or |vim.fn|.
		
		
		@*return* — `true` if array-like table, else `false`.
		
		See: ~https~ ://github.com/openresty/luajit2#tableisarray
	**/
	static function isarray():Void;
	/**
		```lua
		function vim.islist(t?: table)
		  -> boolean
		```
		
		---
		
		 Tests if `t` is a "list": a table indexed _only_ by contiguous integers starting from 1 (what
		 |lua-length| calls a "regular array").
		
		 Empty table `{}` is a list, unless it was created by |vim.empty_dict()| or returned as
		 a dict-like |API| or Vimscript result, for example from |rpcrequest()| or |vim.fn|.
		
		
		@*return* — `true` if list-like table, else `false`.
	**/
	static function islist():Void;
	/**
		```lua
		function vim.keycode(str: string)
		  -> string
		```
		
		---
		
		 Translates keycodes.
		
		 Example:
		
		 ```lua
		 local k = vim.keycode
		 vim.g.mapleader = k'<bs>'
		 ```
		
		@*param* `str` — String to be converted.
		
		 @see |nvim_replace_termcodes()|
	**/
	static function keycode():Void;
	/**
		```lua
		function vim.list_contains(t: table, value: any)
		  -> boolean
		```
		
		---
		
		 Checks if a list-like table (integer keys without gaps) contains `value`.
		
		
		@*param* `t` — Table to check (must be list-like, not validated)
		
		@*param* `value` — Value to compare
		
		@*return* — `true` if `t` contains `value`
	**/
	static function list_contains():Void;
	/**
		```lua
		function vim.list_extend(dst: <T:table>, src: table, start?: integer, finish?: integer)
		  -> dst: <T:table>
		```
		
		---
		
		 Extends a list-like table with the values of another list-like table.
		
		 NOTE: This mutates dst!
		
		
		@*param* `dst` — List which will be modified and appended to
		
		@*param* `src` — List from which values will be inserted
		
		@*param* `start` — Start index on src. Defaults to 1
		
		@*param* `finish` — Final index on src. Defaults to `#src`
	**/
	static function list_extend<T>():Void;
	/**
		```lua
		function vim.list_slice(list: <T>[], start: integer|nil, finish: integer|nil)
		  -> Copy: <T>[]
		```
		
		---
		
		 Creates a copy of a table containing only elements from start to end (inclusive)
		
		@*param* `list` — Table
		
		@*param* `start` — Start range of slice
		
		@*param* `finish` — End range of slice
		
		@*return* `Copy` — of table sliced from start to finish (inclusive)
	**/
	static function list_slice<T>():Void;
	/**
		```lua
		function vim.lua_omnifunc(find_start: 0|1, _: any)
		  -> integer|any[]
		```
		
		---
		
		 Omnifunc for completing Lua values from the runtime Lua interpreter,
		 similar to the builtin completion for the `:lua` command.
		
		 Activate using `set omnifunc=v:lua.vim.lua_omnifunc` in a Lua buffer.
		
		```lua
		find_start:
		    | 1
		    | 0
		```
	**/
	static function lua_omnifunc():Void;
	/**
		```lua
		function vim.notify(msg: string, level: integer|nil, opts: table|nil)
		```
		
		---
		
		 Displays a notification to the user.
		
		 This function can be overridden by plugins to display notifications using
		 a custom provider (such as the system notification provider). By default,
		 writes to |:messages|.
		
		@*param* `msg` — Content of the notification to show to the user.
		
		@*param* `level` — One of the values from |vim.log.levels|.
		
		@*param* `opts` — Optional parameters. Unused by default.
		
		 luacheck: no unused args
	**/
	static function notify():Void;
	/**
		```lua
		function vim.notify_once(msg: string, level: integer|nil, opts: table|nil)
		  -> true: boolean
		```
		
		---
		
		 Displays a notification only one time.
		
		 Like |vim.notify()|, but subsequent calls with the same message will not
		 display a notification.
		
		@*param* `msg` — Content of the notification to show to the user.
		
		@*param* `level` — One of the values from |vim.log.levels|.
		
		@*param* `opts` — Optional parameters. Unused by default.
		
		@*return* `true` — if message was displayed, else false
	**/
	static function notify_once():Void;
	/**
		```lua
		function vim.on_key(fn: fun(key: string, typed: string):string?|nil, ns_id?: integer, opts?: table)
		  -> Namespace: integer
		```
		
		---
		
		 Adds Lua function {fn} with namespace id {ns_id} as a listener to every,
		 yes every, input key.
		
		 The Nvim command-line option |-w| is related but does not support callbacks
		 and cannot be toggled dynamically.
		
		           it won't be invoked for those keys.
		
		@*param* `fn` — Function invoked for every input key,
		
		          after mappings have been applied but before further processing. Arguments
		          {key} and {typed} are raw keycodes, where {key} is the key after mappings
		          are applied, and {typed} is the key(s) before mappings are applied.
		          {typed} may be empty if {key} is produced by non-typed key(s) or by the
		          same typed key(s) that produced a previous {key}.
		          If {fn} returns an empty string, {key} is discarded/ignored.
		          When {fn} is `nil`, the callback associated with namespace {ns_id} is removed.
		
		@*param* `ns_id` — Namespace ID. If nil or 0, generates and returns a
		
		                      new |nvim_create_namespace()| id.
		
		@*param* `opts` — Optional parameters
		
		
		
		@*return* `Namespace` — id associated with {fn}. Or count of all callbacks
		
		if on_key() is called without arguments.
	**/
	static function on_key():Void;
	/**
		```lua
		function vim.paste(lines: string[], phase: -1|1|2|3)
		  -> result: boolean
		```
		
		---
		
		 Paste handler, invoked by |nvim_paste()|.
		
		 Note: This is provided only as a "hook", don't call it directly; call |nvim_paste()| instead,
		 which arranges redo (dot-repeat) and invokes `vim.paste`.
		
		 Example: To remove ANSI color codes when pasting:
		
		 ```lua
		 vim.paste = (function(overridden)
		   return function(lines, phase)
		     for i,line in ipairs(lines) do
		       -- Scrub ANSI color codes from paste input.
		       lines[i] = line:gsub('\27%[[0-9;mK]+', '')
		     end
		     return overridden(lines, phase)
		   end
		 end)(vim.paste)
		 ```
		
		
		@*param* `lines` — |readfile()|-style list of lines to paste. |channel-lines|
		
		@*param* `phase` — -1: "non-streaming" paste: the call contains all lines.
		
		              If paste is "streamed", `phase` indicates the stream state:
		                - 1: starts the paste (exactly once)
		                - 2: continues the paste (zero or more times)
		                - 3: ends the paste (exactly once)
		
		@*return* `result` — false if client should cancel the paste.
		
		```lua
		phase:
		    | -1
		    | 1
		    | 2
		    | 3
		```
	**/
	static function paste():Void;
	/**
		```lua
		function vim.pesc(s: string)
		  -> string
		```
		
		---
		
		 Escapes magic chars in |lua-pattern|s.
		
		@*param* `s` — String to escape
		
		@*return* — %-escaped pattern string
		
		See: ~https~ ://github.com/rxi/lume
	**/
	static function pesc():Void;
	/**
		```lua
		function vim.print(...any)
		  -> any
		```
		
		---
		
		 "Pretty prints" the given arguments and returns them unmodified.
		
		 Example:
		
		 ```lua
		 local hl_normal = vim.print(vim.api.nvim_get_hl(0, { name = 'Normal' }))
		 ```
		
		 @see |vim.inspect()|
		 @see |:=|
		
		@*return* — given arguments.
	**/
	static function print():Void;
	/**
		```lua
		function vim.regex(re: string)
		  -> vim.regex
		```
		
		---
		
		 Parses the Vim regex `re` and returns a regex object. Regexes are "magic" and case-sensitive by
		 default, regardless of 'magic' and 'ignorecase'. They can be controlled with flags, see |/magic|
		 and |/ignorecase|.
	**/
	static function regex():Void;
	/**
		```lua
		function vim.region(bufnr: integer, pos1: string|integer[], pos2: string|integer[], regtype: string, inclusive: boolean)
		  -> region: table
		```
		
		---
		
		 Gets a dict of line segment ("chunk") positions for the region from `pos1` to `pos2`.
		
		 Input and output positions are byte positions, (0,0)-indexed. "End of line" column
		 position (for example, |linewise| visual selection) is returned as |v:maxcol| (big number).
		
		@*param* `bufnr` — Buffer number, or 0 for current buffer
		
		@*param* `pos1` — Start of region as a (line, column) tuple or |getpos()|-compatible string
		
		@*param* `pos2` — End of region as a (line, column) tuple or |getpos()|-compatible string
		
		@*param* `regtype` — [setreg()]-style selection type
		
		@*param* `inclusive` — Controls whether the ending column is inclusive (see also 'selection').
		
		@*return* `region` — Dict of the form `{linenr = {startcol,endcol}}`. `endcol` is exclusive, and
		
		whole lines are returned as `{startcol,endcol} = {0,-1}`.
	**/
	@:deprecated
	static function region():Void;
	/**
		```lua
		function vim.ringbuf(size: integer)
		  -> ringbuf: vim.Ringbuf
		```
		
		---
		
		 Create a ring buffer limited to a maximal number of items.
		 Once the buffer is full, adding a new entry overrides the oldest entry.
		
		 ```lua
		 local ringbuf = vim.ringbuf(4)
		 ringbuf:push("a")
		 ringbuf:push("b")
		 ringbuf:push("c")
		 ringbuf:push("d")
		 ringbuf:push("e")    -- overrides "a"
		 print(ringbuf:pop()) -- returns "b"
		 print(ringbuf:pop()) -- returns "c"
		
		 -- Can be used as iterator. Pops remaining items:
		 for val in ringbuf do
		   print(val)
		 end
		 ```
		
		 Returns a Ringbuf instance with the following methods:
		
		 - |Ringbuf:push()|
		 - |Ringbuf:pop()|
		 - |Ringbuf:peek()|
		 - |Ringbuf:clear()|
	**/
	static function ringbuf():Void;
	/**
		```lua
		function vim.rpcnotify(channel: integer, method: string, ...any)
		```
		
		---
		
		 Sends {event} to {channel} via |RPC| and returns immediately. If {channel}
		 is 0, the event is broadcast to all channels.
		
		 This function also works in a fast callback |lua-loop-callbacks|.
	**/
	static function rpcnotify():Void;
	/**
		```lua
		function vim.rpcrequest(channel: integer, method: string, ...any)
		```
		
		---
		
		 Sends a request to {channel} to invoke {method} via |RPC| and blocks until
		 a response is received.
		
		 Note: NIL values as part of the return value is represented as |vim.NIL|
		 special value
	**/
	static function rpcrequest():Void;
	/**
		```lua
		function vim.schedule(fn: fun())
		```
		
		---
		
		 Schedules {fn} to be invoked soon by the main event-loop. Useful
		 to avoid |textlock| or other temporary restrictions.
	**/
	static function schedule():Void;
	/**
		```lua
		function vim.schedule_wrap(fn: function)
		  -> function
		```
		
		---
		
		 Returns a function which calls {fn} via |vim.schedule()|.
		
		 The returned function passes all arguments to {fn}.
		
		 Example:
		
		 ```lua
		 function notify_readable(_err, readable)
		   vim.notify("readable? " .. tostring(readable))
		 end
		 vim.uv.fs_access(vim.fn.stdpath("config"), "R", vim.schedule_wrap(notify_readable))
		 ```
	**/
	static function schedule_wrap():Void;
	/**
		```lua
		function vim.show_pos(bufnr?: integer, row?: integer, col?: integer, filter?: vim._inspector.Filter)
		```
		
		---
		
		Show all the items at a given buffer position.
		
		Can also be shown with `:Inspect`. [:Inspect](file:///usr/local/share/nvim/runtime/lua/vim)
		
		Example: To bind this function to the vim-scriptease
		inspired `zS` in Normal mode:
		
		```lua
		vim.keymap.set('n', 'zS', vim.show_pos)
		```
		
		@*param* `bufnr` — defaults to the current buffer
		
		@*param* `row` — row to inspect, 0-based. Defaults to the row of the current cursor
		
		@*param* `col` — col to inspect, 0-based. Defaults to the col of the current cursor
	**/
	static function show_pos():Void;
	/**
		```lua
		function vim.spairs(t: <T:table>)
		  -> fun(table: table<<K>, <V>>, index?: <K>):<K>, <V>
		  2. <T:table>
		```
		
		---
		
		 Enumerates key-value pairs of a table, ordered by key.
		
		
		@*param* `t` — Dict-like table
		
		@*return* — |for-in| iterator over sorted keys and their values
		
		@*return*
		
		See: ~Based~ on https://github.com/premake/premake-core/blob/master/src/base/table.lua
	**/
	static function spairs<T, K, V>():Void;
	/**
		```lua
		function vim.split(s: string, sep: string, opts?: vim.gsplit.Opts)
		  -> string[]
		```
		
		---
		
		 Splits a string at each instance of a separator and returns the result as a table (unlike
		 |vim.gsplit()|).
		
		 Examples:
		
		 ```lua
		 split(":aa::b:", ":")                   --> {'','aa','','b',''}
		 split("axaby", "ab?")                   --> {'','x','y'}
		 split("x*yz*o", "*", {plain=true})      --> {'x','yz','o'}
		 split("|x|y|z|", "|", {trimempty=true}) --> {'x', 'y', 'z'}
		 ```
		
		
		@*param* `s` — String to split
		
		@*param* `sep` — Separator or pattern
		
		@*param* `opts` — Keyword arguments |kwargs|:
		
		@*return* — : List of split components
	**/
	static function split():Void;
	/**
		```lua
		function vim.startswith(s: string, prefix: string)
		  -> boolean
		```
		
		---
		
		 Tests if `s` starts with `prefix`.
		
		@*param* `s` — String
		
		@*param* `prefix` — Prefix to match
		
		@*return* — `true` if `prefix` is a prefix of `s`
	**/
	static function startswith():Void;
	/**
		```lua
		function vim.str_byteindex(s: string, encoding: "utf-16"|"utf-32"|"utf-8", index: integer, strict_indexing?: boolean)
		  -> integer
		```
		
		---
		
		 Convert UTF-32, UTF-16 or UTF-8 {index} to byte index.
		 If {strict_indexing} is false
		 then then an out of range index will return byte length
		 instead of throwing an error.
		
		 Invalid UTF-8 and NUL is treated like in |vim.str_utfindex()|.
		 An {index} in the middle of a UTF-16 sequence is rounded upwards to
		 the end of that sequence.
		
		@*param* `strict_indexing` — default: true
		
		```lua
		encoding:
		    | "utf-8"
		    | "utf-16"
		    | "utf-32"
		```
	**/
	static function str_byteindex():Void;
	/**
		```lua
		function vim.str_utf_end(str: string, index: integer)
		  -> integer
		```
		
		---
		
		 Gets the distance (in bytes) from the last byte of the codepoint (character) that {index} points
		 to.
		
		 Examples:
		
		 ```lua
		 -- The character 'æ' is stored as the bytes '\xc3\xa6' (using UTF-8)
		
		 -- Returns 0 because the index is pointing at the last byte of a character
		 vim.str_utf_end('æ', 2)
		
		 -- Returns 1 because the index is pointing at the penultimate byte of a character
		 vim.str_utf_end('æ', 1)
		 ```
	**/
	static function str_utf_end():Void;
	/**
		```lua
		function vim.str_utf_pos(str: string)
		  -> integer[]
		```
		
		---
		
		 Gets a list of the starting byte positions of each UTF-8 codepoint in the given string.
		
		 Embedded NUL bytes are treated as terminating the string.
	**/
	static function str_utf_pos():Void;
	/**
		```lua
		function vim.str_utf_start(str: string, index: integer)
		  -> integer
		```
		
		---
		
		 Gets the distance (in bytes) from the starting byte of the codepoint (character) that {index}
		 points to.
		
		 The result can be added to {index} to get the starting byte of a character.
		
		 Examples:
		
		 ```lua
		 -- The character 'æ' is stored as the bytes '\xc3\xa6' (using UTF-8)
		
		 -- Returns 0 because the index is pointing at the first byte of a character
		 vim.str_utf_start('æ', 1)
		
		 -- Returns -1 because the index is pointing at the second byte of a character
		 vim.str_utf_start('æ', 2)
		 ```
	**/
	static function str_utf_start():Void;
	/**
		```lua
		function vim.str_utfindex(s: string, encoding: "utf-16"|"utf-32"|"utf-8", index?: integer, strict_indexing?: boolean)
		  -> integer
		```
		
		---
		
		 Convert byte index to UTF-32, UTF-16 or UTF-8 indices. If {index} is not
		 supplied, the length of the string is used. All indices are zero-based.
		
		 If {strict_indexing} is false then an out of range index will return string
		 length instead of throwing an error.
		 Invalid UTF-8 bytes, and embedded surrogates are counted as one code point
		 each. An {index} in the middle of a UTF-8 sequence is rounded upwards to the end of
		 that sequence.
		
		@*param* `strict_indexing` — default: true
		
		```lua
		encoding:
		    | "utf-8"
		    | "utf-16"
		    | "utf-32"
		```
	**/
	static function str_utfindex():Void;
	/**
		```lua
		function vim.stricmp(a: string, b: string)
		  -> -1|0|1
		```
		
		---
		
		 Compares strings case-insensitively.
		 if strings are
		 equal, {a} is greater than {b} or {a} is lesser than {b}, respectively.
		
		```lua
		return #1:
		    | 0
		    | 1
		    | -1
		```
	**/
	static function stricmp():Void;
	/**
		```lua
		function vim.system(cmd: string[], opts?: vim.SystemOpts, on_exit?: fun(out: vim.SystemCompleted))
		  -> Object: vim.SystemObj
		```
		
		---
		
		 TODO(lewis6991): document that the signature is system({cmd}, [{opts},] {on_exit})
		 Runs a system command or throws an error if {cmd} cannot be run.
		
		 Examples:
		
		 ```lua
		 local on_exit = function(obj)
		   print(obj.code)
		   print(obj.signal)
		   print(obj.stdout)
		   print(obj.stderr)
		 end
		
		 -- Runs asynchronously:
		 vim.system({'echo', 'hello'}, { text = true }, on_exit)
		
		 -- Runs synchronously:
		 local obj = vim.system({'echo', 'hello'}, { text = true }):wait()
		 -- { code = 0, signal = 0, stdout = 'hello\n', stderr = '' }
		
		 ```
		
		 See |uv.spawn()| for more details. Note: unlike |uv.spawn()|, vim.system
		 throws an error if {cmd} cannot be run.
		
		@*param* `cmd` — Command to execute
		
		@*param* `opts` — Options:
		
		   - cwd: (string) Set the current working directory for the sub-process.
		   - env: table<string,string> Set environment variables for the new process. Inherits the
		     current environment with `NVIM` set to |v:servername|.
		   - clear_env: (boolean) `env` defines the job environment exactly, instead of merging current
		     environment. Note: if `env` is `nil`, the current environment is used but without `NVIM` set.
		   - stdin: (string|string[]|boolean) If `true`, then a pipe to stdin is opened and can be written
		     to via the `write()` method to SystemObj. If string or string[] then will be written to stdin
		     and closed. Defaults to `false`.
		   - stdout: (boolean|function)
		     Handle output from stdout. When passed as a function must have the signature `fun(err: string, data: string)`.
		     Defaults to `true`
		   - stderr: (boolean|function)
		     Handle output from stderr. When passed as a function must have the signature `fun(err: string, data: string)`.
		     Defaults to `true`.
		   - text: (boolean) Handle stdout and stderr as text. Replaces `\r\n` with `\n`.
		   - timeout: (integer) Run the command with a time limit. Upon timeout the process is sent the
		     TERM signal (15) and the exit code is set to 124.
		   - detach: (boolean) If true, spawn the child process in a detached state - this will make it
		     a process group leader, and will effectively enable the child to keep running after the
		     parent exits. Note that the child process will still keep the parent's event loop alive
		     unless the parent process calls |uv.unref()| on the child's process handle.
		
		@*param* `on_exit` — Called when subprocess exits. When provided, the command runs
		
		   asynchronously. Receives SystemCompleted object, see return of SystemObj:wait().
		
		@*return* `Object` — with the fields:
		
		   - cmd (string[]) Command name and args
		   - pid (integer) Process ID
		   - wait (fun(timeout: integer|nil): SystemCompleted) Wait for the process to complete. Upon
		     timeout the process is sent the KILL signal (9) and the exit code is set to 124. Cannot
		     be called in |api-fast|.
		     - SystemCompleted is an object with the fields:
		       - code: (integer)
		       - signal: (integer)
		       - stdout: (string), nil if stdout argument is passed
		       - stderr: (string), nil if stderr argument is passed
		   - kill (fun(signal: integer|string))
		   - write (fun(data: string|nil)) Requires `stdin=true`. Pass `nil` to close the stream.
		   - is_closing (fun(): boolean)
	**/
	static function system():Void;
	/**
		```lua
		function vim.tbl_add_reverse_lookup(o: table)
		  -> o: table
		```
		
		---
		
		 Add the reverse lookup values to an existing table.
		 For example:
		 `tbl_add_reverse_lookup { A = 1 } == { [1] = 'A', A = 1 }`
		
		 Note that this *modifies* the input.
		
		@*param* `o` — Table to add the reverse to
	**/
	@:deprecated
	static function tbl_add_reverse_lookup():Void;
	/**
		```lua
		function vim.tbl_contains(t: table, value: any, opts?: vim.tbl_contains.Opts)
		  -> boolean
		```
		
		---
		
		 Checks if a table contains a given value, specified either directly or via
		 a predicate that is checked for each value.
		
		 Example:
		
		 ```lua
		 vim.tbl_contains({ 'a', { 'b', 'c' } }, function(v)
		   return vim.deep_equal(v, { 'b', 'c' })
		 end, { predicate = true })
		 -- true
		 ```
		
		
		@*param* `t` — Table to check
		
		@*param* `value` — Value to compare or predicate function reference
		
		@*param* `opts` — Keyword arguments |kwargs|:
		
		@*return* — `true` if `t` contains `value`
	**/
	static function tbl_contains():Void;
	/**
		```lua
		function vim.tbl_count(t: table)
		  -> integer
		```
		
		---
		
		 Counts the number of non-nil values in table `t`.
		
		 ```lua
		 vim.tbl_count({ a=1, b=2 })  --> 2
		 vim.tbl_count({ 1, 2 })      --> 2
		 ```
		
		@*param* `t` — Table
		
		@*return* — : Number of non-nil values in table
		
		See: ~https~ ://github.com/Tieske/Penlight/blob/master/lua/pl/tablex.lua
	**/
	static function tbl_count():Void;
	/**
		```lua
		function vim.tbl_deep_extend(behavior: 'error'|'force'|'keep', ...<T2:table>)
		  -> <T1:table>|<T2:table>
		```
		
		---
		
		 Merges recursively two or more tables.
		
		 Only values that are empty tables or tables that are not |lua-list|s (indexed by consecutive
		 integers starting from 1) are merged recursively. This is useful for merging nested tables
		 like default and user configurations where lists should be treated as literals (i.e., are
		 overwritten instead of merged).
		
		
		@*param* `behavior` — Decides what to do if a key is found in more than one map:
		
		      - "error": raise an error
		      - "keep":  use value from the leftmost map
		      - "force": use value from the rightmost map
		
		@*param* `...` — Two or more tables
		
		@*return* — (table) Merged table
		
		```lua
		behavior:
		    | 'error'
		    | 'keep'
		    | 'force'
		```
	**/
	static function tbl_deep_extend<T1, T2>():Void;
	/**
		```lua
		function vim.tbl_extend(behavior: 'error'|'force'|'keep', ...table)
		  -> table
		```
		
		---
		
		 Merges two or more tables.
		
		
		@*param* `behavior` — Decides what to do if a key is found in more than one map:
		
		      - "error": raise an error
		      - "keep":  use value from the leftmost map
		      - "force": use value from the rightmost map
		
		@*param* `...` — Two or more tables
		
		@*return* — : Merged table
		
		```lua
		behavior:
		    | 'error'
		    | 'keep'
		    | 'force'
		```
	**/
	static function tbl_extend():Void;
	/**
		```lua
		function vim.tbl_filter(func: fun(value: <T>):boolean, t: table<any, <T>>)
		  -> <T>[]
		```
		
		---
		
		 Filter a table using a predicate function
		
		@*param* `func` — (function) Function
		
		@*param* `t` — (table) Table
		
		@*return* — : Table of filtered values
	**/
	static function tbl_filter<T>():Void;
	/**
		```lua
		function vim.tbl_flatten(t: table)
		  -> Flattened: table
		```
		
		---
		
		 Creates a copy of a list-like table such that any nested tables are
		 "unrolled" and appended to the result.
		
		
		@*param* `t` — List-like table
		
		@*return* `Flattened` — copy of the given list-like table
		
		See: ~From~ https://github.com/premake/premake-core/blob/master/src/base/table.lua
	**/
	@:deprecated
	static function tbl_flatten():Void;
	/**
		```lua
		function vim.tbl_get(o: table, ...any)
		  -> any
		```
		
		---
		
		 Index into a table (first argument) via string keys passed as subsequent arguments.
		 Return `nil` if the key does not exist.
		
		 Examples:
		
		 ```lua
		 vim.tbl_get({ key = { nested_key = true }}, 'key', 'nested_key') == true
		 vim.tbl_get({ key = {}}, 'key', 'nested_key') == nil
		 ```
		
		@*param* `o` — Table to index
		
		@*param* `...` — Optional keys (0 or more, variadic) via which to index the table
		
		@*return* — Nested value indexed by key (if it exists), else nil
	**/
	static function tbl_get():Void;
	/**
		```lua
		function vim.tbl_isempty(t: table)
		  -> boolean
		```
		
		---
		
		 Checks if a table is empty.
		
		
		@*param* `t` — Table to check
		
		@*return* — `true` if `t` is empty
		
		See: ~https~ ://github.com/premake/premake-core/blob/master/src/base/table.lua
	**/
	static function tbl_isempty():Void;
	/**
		```lua
		function vim.tbl_islist(t: any)
		  -> boolean
		```
	**/
	@:deprecated
	static function tbl_islist():Void;
	/**
		```lua
		function vim.tbl_keys(t: table<<T>, any>)
		  -> <T>[]
		```
		
		---
		
		 Return a list of all keys used in a table.
		 However, the order of the return table of keys is not guaranteed.
		
		
		@*param* `t` — (table) Table
		
		@*return* — : List of keys
		
		See: ~From~ https://github.com/premake/premake-core/blob/master/src/base/table.lua
	**/
	static function tbl_keys<T>():Void;
	/**
		```lua
		function vim.tbl_map(func: fun(value: <T>):any, t: table<any, <T>>)
		  -> table
		```
		
		---
		
		 Apply a function to all values of a table.
		
		@*param* `func` — Function
		
		@*param* `t` — Table
		
		@*return* — : Table of transformed values
	**/
	static function tbl_map<T>():Void;
	/**
		```lua
		function vim.tbl_values(t: table<any, <T>>)
		  -> <T>[]
		```
		
		---
		
		 Return a list of all values used in a table.
		 However, the order of the return table of values is not guaranteed.
		
		@*param* `t` — (table) Table
		
		@*return* — : List of values
	**/
	static function tbl_values<T>():Void;
	/**
		```lua
		function vim.trim(s: string)
		  -> String: string
		```
		
		---
		
		 Trim whitespace (Lua pattern "%s") from both sides of a string.
		
		@*param* `s` — String to trim
		
		@*return* `String` — with whitespace removed from its beginning and end
		
		See: ~https~ ://www.lua.org/pil/20.2.html
	**/
	static function trim():Void;
	/**
		```lua
		function vim.ui_attach(ns: integer, options: table<string, any>, callback: fun())
		```
		
		---
		
		 Subscribe to |ui-events|, similar to |nvim_ui_attach()| but receive events in a Lua callback.
		 Used to implement screen elements like popupmenu or message handling in Lua.
		
		 {options} is a dict with one or more `ext_…` |ui-option|s set to true to enable events for
		 the respective UI element.
		
		 {callback} receives event name plus additional parameters. See |ui-popupmenu|
		 and the sections below for event format for respective events.
		
		 Callbacks for `msg_show` events are executed in |api-fast| context; showing
		 the message should be scheduled.
		
		 Excessive errors inside the callback will result in forced detachment.
		
		 WARNING: This api is considered experimental.  Usability will vary for
		 different screen elements. In particular `ext_messages` behavior is subject
		 to further changes and usability improvements.  This is expected to be
		 used to handle messages when setting 'cmdheight' to zero (which is
		 likewise experimental).
		
		 Example (stub for a |ui-popupmenu| implementation):
		
		 ```lua
		 ns = vim.api.nvim_create_namespace('my_fancy_pum')
		
		 vim.ui_attach(ns, {ext_popupmenu=true}, function(event, ...)
		   if event == 'popupmenu_show' then
		     local items, selected, row, col, grid = ...
		     print('display pum ', #items)
		   elseif event == 'popupmenu_select' then
		     local selected = ...
		     print('selected', selected)
		   elseif event == 'popupmenu_hide' then
		     print('FIN')
		   end
		 end)
		 ```
		
		 @since 0
	**/
	static function ui_attach():Void;
	/**
		```lua
		function vim.ui_detach(ns: integer)
		```
		
		---
		
		 Detach a callback previously attached with |vim.ui_attach()| for the
		 given namespace {ns}.
	**/
	static function ui_detach():Void;
	/**
		```lua
		function M.uri_from_bufnr(bufnr: integer)
		  -> URI: string
		```
		
		---
		
		Gets a URI from a bufnr.
	**/
	function uri_from_bufnr():Void;
	/**
		```lua
		function M.uri_from_fname(path: string)
		  -> URI: string
		```
		
		---
		
		Gets a URI from a file path.
		
		@*param* `path` — Path to file
	**/
	function uri_from_fname():Void;
	/**
		```lua
		function M.uri_to_bufnr(uri: string)
		  -> bufnr: integer
		```
		
		---
		
		Gets the buffer for a uri.
		Creates a new unloaded buffer if no buffer for the uri already exists.
	**/
	function uri_to_bufnr():Void;
	/**
		```lua
		function M.uri_to_fname(uri: string)
		  -> filename: string
		```
		
		---
		
		Gets a filename from a URI.
		
		@*return* `filename` — or unchanged URI for non-file URIs
	**/
	function uri_to_fname():Void;
	/**
		```lua
		function vim.validate(name: string, value: any, validator: "boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable'|("boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable')[]|fun(v: any):boolean, string?, optional?: boolean, message?: string)
		```
		
		---
		
		 Validate function arguments.
		
		 This function has two valid forms:
		
		 1. `vim.validate(name, value, validator[, optional][, message])`
		
		     Validates that argument {name} with value {value} satisfies
		     {validator}. If {optional} is given and is `true`, then {value} may be
		     `nil`. If {message} is given, then it is used as the expected type in the
		     error message.
		
		     Example:
		
		     ```lua
		       function vim.startswith(s, prefix)
		         vim.validate('s', s, 'string')
		         vim.validate('prefix', prefix, 'string')
		         -- ...
		       end
		     ```
		
		 2. `vim.validate(spec)` (deprecated)
		     where `spec` is of type
		    `table<string,[value:any, validator: vim.validate.Validator, optional_or_msg? : boolean|string]>)`
		
		     Validates a argument specification.
		     Specs are evaluated in alphanumeric order, until the first failure.
		
		     Example:
		
		     ```lua
		       function user.new(name, age, hobbies)
		         vim.validate{
		           name={name, 'string'},
		           age={age, 'number'},
		           hobbies={hobbies, 'table'},
		         }
		         -- ...
		       end
		     ```
		
		 Examples with explicit argument values (can be run directly):
		
		 ```lua
		 vim.validate('arg1', {'foo'}, 'table')
		    --> NOP (success)
		 vim.validate('arg2', 'foo', 'string')
		    --> NOP (success)
		
		 vim.validate('arg1', 1, 'table')
		    --> error('arg1: expected table, got number')
		
		 vim.validate('arg1', 3, function(a) return (a % 2) == 0 end, 'even number')
		    --> error('arg1: expected even number, got 3')
		 ```
		
		 If multiple types are valid they can be given as a list.
		
		 ```lua
		 vim.validate('arg1', {'foo'}, {'table', 'string'})
		 vim.validate('arg2', 'foo', {'table', 'string'})
		 -- NOP (success)
		
		 vim.validate('arg1', 1, {'string', 'table'})
		 -- error('arg1: expected string|table, got number')
		 ```
		
		 @note `validator` set to a value returned by |lua-type()| provides the
		 best performance.
		
		@*param* `name` — Argument name
		
		@*param* `value` — Argument value
		
		   - (`string|string[]`): Any value that can be returned from |lua-type()| in addition to
		     `'callable'`: `'boolean'`, `'callable'`, `'function'`, `'nil'`, `'number'`, `'string'`, `'table'`,
		     `'thread'`, `'userdata'`.
		   - (`fun(val:any): boolean, string?`) A function that returns a boolean and an optional
		     string message.
		
		@*param* `optional` — Argument is optional (may be omitted)
		
		@*param* `message` — message when validation fails
		
		---
		
		```lua
		validator:
		    | "nil"
		    | "number"
		    | "string"
		    | "boolean"
		    | "table"
		    | "function"
		    | "thread"
		    | "userdata"
		    | 'callable'
		```
		
		---
		
		```lua
		function vim.validate(name: string, val: any, validator: "boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable'|("boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable')[]|fun(v: any):boolean, string?, message: string)
		```
		
		---
		
		```lua
		function vim.validate(spec: table<string, [any, "boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable'|("boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'c...(too long)...|string] })
		```
	**/
	static function validate():Void;
	/**
		```lua
		function vim.wait(time: integer, callback?: fun():boolean, interval?: integer, fast_only?: boolean)
		  -> boolean
		  2. -1|-2|nil
		```
		
		---
		
		 Wait for {time} in milliseconds until {callback} returns `true`.
		
		 Executes {callback} immediately and at approximately {interval}
		 milliseconds (default 200). Nvim still processes other events during
		 this time.
		
		 Cannot be called while in an |api-fast| event.
		
		 Examples:
		
		 ```lua
		 ---
		 -- Wait for 100 ms, allowing other events to process
		 vim.wait(100, function() end)
		
		 ---
		 -- Wait for 100 ms or until global variable set.
		 vim.wait(100, function() return vim.g.waiting_for_var end)
		
		 ---
		 -- Wait for 1 second or until global variable set, checking every ~500 ms
		 vim.wait(1000, function() return vim.g.waiting_for_var end, 500)
		
		 ---
		 -- Schedule a function to set a value in 100ms
		 vim.defer_fn(function() vim.g.timer_result = true end, 100)
		
		 -- Would wait ten seconds if results blocked. Actually only waits  100 ms
		 if vim.wait(10000, function() return vim.g.timer_result end) then
		   print('Only waiting a little bit of time!')
		 end
		 ```
		
		@*param* `time` — Number of milliseconds to wait
		
		@*param* `callback` — Optional callback. Waits until {callback} returns true
		
		@*param* `interval` — (Approximate) number of milliseconds to wait between polls
		
		@*param* `fast_only` — If true, only |api-fast| events will be processed.
		
		     - If {callback} returns `true` during the {time}: `true, nil`
		     - If {callback} never returns `true` during the {time}: `false, -1`
		     - If {callback} is interrupted during the {time}: `false, -2`
		     - If {callback} errors, the error is raised.
		
		```lua
		return #2:
		    | -1
		    | -2
		```
	**/
	static function wait():Void;
}