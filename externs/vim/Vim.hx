package vim;

@:native("vim") extern class Vim {
	/**
		```lua\nfunction vim.call(func: string, ...any)\n  -> any\n```\n\n---\n\n Invokes |vim-function| or |user-function| {func} with arguments {...}.\n See also |vim.fn|.\n Equivalent to:\n\n ```lua\n vim.fn[func](file:///usr/local/share/nvim/runtime/lua/vim/_meta/%7B...%7D)\n ```
	**/
	static function call():Void;
	/**
		```lua\nfunction vim.deep_equal(a: any, b: any)\n  -> boolean\n```\n\n---\n\n Deep compare values for equality\n\n Tables are compared recursively unless they both provide the `eq` metamethod.\n All other types are compared using the equality `==` operator.\n\n@*param* `a` — First value\n\n@*param* `b` — Second value\n\n@*return* — `true` if values are equals, else `false`
	**/
	static function deep_equal():Void;
	/**
		```lua\nfunction vim.deepcopy(orig: <T:table>, noref?: boolean)\n  -> Table: <T:table>\n```\n\n---\n\n Returns a deep copy of the given object. Non-table objects are copied as\n in a typical Lua assignment, whereas table objects are copied recursively.\n Functions are naively copied, so functions in the copied table point to the\n same functions as those in the input table. Userdata and threads are not\n copied and will throw an error.\n\n Note: `noref=true` is much more performant on tables with unique table\n fields, while `noref=false` is more performant on tables that reuse table\n fields.\n\n@*param* `orig` — Table to copy\n\n When `false` (default) a contained table is only copied once and all\n references point to this single copy. When `true` every occurrence of a\n table results in a new copy. This also means that a cyclic reference can\n cause `deepcopy()` to fail.\n\n@*return* `Table` — of copied keys and (nested) values.
	**/
	static function deepcopy():Void;
	/**
		```lua\nfunction vim.defaulttable(createfn?: fun(key: any):any)\n  -> table\n```\n\n---\n\n Creates a table whose missing keys are provided by {createfn} (like Python's "defaultdict").\n\n If {createfn} is `nil` it defaults to defaulttable() itself, so accessing nested keys creates\n nested tables:\n\n ```lua\n local a = vim.defaulttable()\n a.b.c = 1\n ```\n\n@*param* `createfn` — Provides the value for a missing `key`.\n\n@*return* — Empty table with `__index` metamethod.
	**/
	static function defaulttable():Void;
	/**
		```lua\nfunction vim.defer_fn(fn: function, timeout: integer)\n  -> timer: table\n```\n\n---\n\n Defers calling {fn} until {timeout} ms passes.\n\n Use to do a one-shot timer that calls {fn}\n Note: The {fn} is |vim.schedule_wrap()|ped automatically, so API functions are\n safe to call.\n\n@*param* `fn` — Callback to call once `timeout` expires\n\n@*param* `timeout` — Number of milliseconds to wait before calling `fn`\n\n@*return* `timer` — luv timer object
	**/
	static function defer_fn():Void;
	/**
		```lua\nfunction vim.deprecate(name: string, alternative: string|nil, version: string, plugin: string|nil, backtrace: boolean|nil)\n  -> string|nil\n```\n\n---\n\n Shows a deprecation message to the user.\n\n@*param* `name` — Deprecated feature (function, API, etc.).\n\n@*param* `alternative` — Suggested alternative feature.\n\n@*param* `version` — Version when the deprecated function will be removed.\n\n@*param* `plugin` — Name of the plugin that owns the deprecated feature.\n\n                              Defaults to "Nvim".\n\n@*param* `backtrace` — Prints backtrace. Defaults to true.\n\n\n@*return* — Deprecated message, or nil if no message was shown.
	**/
	static function deprecate():Void;
	/**
		```lua\nfunction vim.diff(a: string, b: string, opts?: vim.diff.Opts)\n  -> (string|integer[][])?\n```\n\n---\n\n Run diff on strings {a} and {b}. Any indices returned by this function,\n either directly or via callback arguments, are 1-based.\n\n Examples:\n\n ```lua\n vim.diff('a\n', 'b\nc\n')\n -- =>\n -- @@ -1 +1,2 @@\n -- -a\n -- +b\n -- +c\n\n vim.diff('a\n', 'b\nc\n', {result_type = 'indices'})\n -- =>\n -- {\n --   {1, 1, 1, 2}\n -- }\n ```\n\n@*param* `a` — First string to compare\n\n@*param* `b` — Second string to compare\n\n     See {opts.result_type}. `nil` if {opts.on_hunk} is given.
	**/
	static function diff():Void;
	/**
		```lua\nfunction vim.empty_dict()\n  -> table\n```\n\n---\n\n <Docs described in |vim.empty_dict()| >\n TODO: should be in vim.shared when vim.shared always uses nvim-lua\n\n---\n\n Creates a special empty table (marked with a metatable), which Nvim\n converts to an empty dictionary when translating Lua values to Vimscript\n or API types. Nvim by default converts an empty table `{}` without this\n metatable to an list/array.\n\n Note: If numeric keys are present in the table, Nvim ignores the metatable\n marker and converts the dict to a list/array anyway.
	**/
	private static function empty_dict():Void;
	/**
		```lua\nfunction vim.endswith(s: string, suffix: string)\n  -> boolean\n```\n\n---\n\n Tests if `s` ends with `suffix`.\n\n@*param* `s` — String\n\n@*param* `suffix` — Suffix to match\n\n@*return* — `true` if `suffix` is a suffix of `s`
	**/
	static function endswith():Void;
	/**
		```lua\nfunction vim.funcref(viml_func_name: any)\n  -> unknown\n```
	**/
	private static function funcref():Void;
	/**
		```lua\nfunction vim.gsplit(s: string, sep: string, opts?: vim.gsplit.Opts)\n  -> fun():string?\n```\n\n---\n\n Gets an |iterator| that splits a string at each instance of a separator, in "lazy" fashion\n (as opposed to |vim.split()| which is "eager").\n\n Example:\n\n ```lua\n for s in vim.gsplit(':aa::b:', ':', {plain=true}) do\n   print(s)\n end\n ```\n\n If you want to also inspect the separator itself (instead of discarding it), use\n |string.gmatch()|. Example:\n\n ```lua\n for word, num in ('foo111bar222'):gmatch('([^0-9]*)(%d*)') do\n   print(('word: %s num: %s'):format(word, num))\n end\n ```\n\n @see |string.gmatch()|\n @see |vim.split()|\n @see |lua-pattern|s\n\n@*param* `s` — String to split\n\n@*param* `sep` — Separator or pattern\n\n@*param* `opts` — Keyword arguments |kwargs|:\n\n@*return* — : Iterator over the split components\n\nSee:\n  * ~https~ ://www.lua.org/pil/20.2.html\n  * ~http~ ://lua-users.org/wiki/StringLibraryTutorial
	**/
	static function gsplit():Void;
	/**
		```lua\nfunction vim.iconv(str: string, from: string, to: string, opts: any)\n  -> string?\n```\n\n---\n\n The result is a String, which is the text {str} converted from\n encoding {from} to encoding {to}. When the conversion fails `nil` is\n returned.  When some characters could not be converted they\n are replaced with "?".\n The encoding names are whatever the iconv() library function\n can accept, see ":Man 3 iconv".\n\n@*param* `str` — Text to convert\n\n@*param* `from` — Encoding of {str}\n\n@*param* `to` — Target encoding\n\n@*return* — : Converted string if conversion succeeds, `nil` otherwise.
	**/
	static function iconv():Void;
	/**
		```lua\nfunction vim.in_fast_event()\n```\n\n---\n\n Returns true if the code is executing as part of a "fast" event handler,\n where most of the API is disabled. These are low-level events (e.g.\n |lua-loop-callbacks|) which can be invoked whenever Nvim polls for input.\n When this is `false` most API functions are callable (but may be subject\n to other restrictions such as |textlock|).
	**/
	static function in_fast_event():Void;
	/**
		```lua\n(global) vim.inspect: fun(x: any, opts?: vim.inspect.Opts):string\n```\n\n---\n\n Gets a human-readable representation of the given object.\n\nSee:\n  * ~https~ ://github.com/kikito/inspect.lua\n  * ~https~ ://github.com/mpeterv/vinspect\n\n---\n\n```lua\nfunction (x: any, opts?: vim.inspect.Opts)\n  -> string\n```
	**/
	function inspect():Void;
	/**
		```lua\nfunction vim.inspect_pos(bufnr?: integer, row?: integer, col?: integer, filter?: vim._inspector.Filter)\n  -> { treesitter: table, syntax: table, extmarks: table, semantic_tokens: table, buffer: integer, col: integer, row: integer }\n```\n\n---\n\nGet all the items at a given buffer position.\n\nCan also be pretty-printed with `:Inspect!`. [:Inspect!](file:///usr/local/share/nvim/runtime/lua/vim)\n\n@*param* `bufnr` — defaults to the current buffer\n\n@*param* `row` — row to inspect, 0-based. Defaults to the row of the current cursor\n\n@*param* `col` — col to inspect, 0-based. Defaults to the col of the current cursor\n\n@*param* `filter` — Table with key-value pairs to filter the items\n\n@*return* — (table) a table with the following key-value pairs. Items are in "traversal order":\n\n               - treesitter: a list of treesitter captures\n               - syntax: a list of syntax groups\n               - semantic_tokens: a list of semantic tokens\n               - extmarks: a list of extmarks\n               - buffer: the buffer used to get the items\n               - row: the row used to get the items\n               - col: the col used to get the items
	**/
	static function inspect_pos():Void;
	/**
		```lua\nfunction vim.is_callable(f: any)\n  -> boolean\n```\n\n---\n\n Returns true if object `f` can be called as a function.\n\n@*param* `f` — Any object\n\n@*return* — `true` if `f` is callable, else `false`
	**/
	static function is_callable():Void;
	/**
		```lua\nfunction vim.isarray(t?: table)\n  -> boolean\n```\n\n---\n\n Tests if `t` is an "array": a table indexed _only_ by integers (potentially non-contiguous).\n\n If the indexes start from 1 and are contiguous then the array is also a list. |vim.islist()|\n\n Empty table `{}` is an array, unless it was created by |vim.empty_dict()| or returned as\n a dict-like |API| or Vimscript result, for example from |rpcrequest()| or |vim.fn|.\n\n\n@*return* — `true` if array-like table, else `false`.\n\nSee: ~https~ ://github.com/openresty/luajit2#tableisarray
	**/
	static function isarray():Void;
	/**
		```lua\nfunction vim.islist(t?: table)\n  -> boolean\n```\n\n---\n\n Tests if `t` is a "list": a table indexed _only_ by contiguous integers starting from 1 (what\n |lua-length| calls a "regular array").\n\n Empty table `{}` is a list, unless it was created by |vim.empty_dict()| or returned as\n a dict-like |API| or Vimscript result, for example from |rpcrequest()| or |vim.fn|.\n\n\n@*return* — `true` if list-like table, else `false`.
	**/
	static function islist():Void;
	/**
		```lua\nfunction vim.keycode(str: string)\n  -> string\n```\n\n---\n\n Translates keycodes.\n\n Example:\n\n ```lua\n local k = vim.keycode\n vim.g.mapleader = k'<bs>'\n ```\n\n@*param* `str` — String to be converted.\n\n @see |nvim_replace_termcodes()|
	**/
	static function keycode():Void;
	/**
		```lua\nfunction vim.list_contains(t: table, value: any)\n  -> boolean\n```\n\n---\n\n Checks if a list-like table (integer keys without gaps) contains `value`.\n\n\n@*param* `t` — Table to check (must be list-like, not validated)\n\n@*param* `value` — Value to compare\n\n@*return* — `true` if `t` contains `value`
	**/
	static function list_contains():Void;
	/**
		```lua\nfunction vim.list_extend(dst: <T:table>, src: table, start?: integer, finish?: integer)\n  -> dst: <T:table>\n```\n\n---\n\n Extends a list-like table with the values of another list-like table.\n\n NOTE: This mutates dst!\n\n\n@*param* `dst` — List which will be modified and appended to\n\n@*param* `src` — List from which values will be inserted\n\n@*param* `start` — Start index on src. Defaults to 1\n\n@*param* `finish` — Final index on src. Defaults to `#src`
	**/
	static function list_extend():Void;
	/**
		```lua\nfunction vim.list_slice(list: <T>[], start: integer|nil, finish: integer|nil)\n  -> Copy: <T>[]\n```\n\n---\n\n Creates a copy of a table containing only elements from start to end (inclusive)\n\n@*param* `list` — Table\n\n@*param* `start` — Start range of slice\n\n@*param* `finish` — End range of slice\n\n@*return* `Copy` — of table sliced from start to finish (inclusive)
	**/
	static function list_slice():Void;
	/**
		```lua\nfunction vim.lua_omnifunc(find_start: 0|1, _: any)\n  -> integer|any[]\n```\n\n---\n\n Omnifunc for completing Lua values from the runtime Lua interpreter,\n similar to the builtin completion for the `:lua` command.\n\n Activate using `set omnifunc=v:lua.vim.lua_omnifunc` in a Lua buffer.\n\n```lua\nfind_start:\n    | 1\n    | 0\n```
	**/
	static function lua_omnifunc():Void;
	/**
		```lua\nfunction vim.notify(msg: string, level: integer|nil, opts: table|nil)\n```\n\n---\n\n Displays a notification to the user.\n\n This function can be overridden by plugins to display notifications using\n a custom provider (such as the system notification provider). By default,\n writes to |:messages|.\n\n@*param* `msg` — Content of the notification to show to the user.\n\n@*param* `level` — One of the values from |vim.log.levels|.\n\n@*param* `opts` — Optional parameters. Unused by default.\n\n luacheck: no unused args
	**/
	static function notify():Void;
	/**
		```lua\nfunction vim.notify_once(msg: string, level: integer|nil, opts: table|nil)\n  -> true: boolean\n```\n\n---\n\n Displays a notification only one time.\n\n Like |vim.notify()|, but subsequent calls with the same message will not\n display a notification.\n\n@*param* `msg` — Content of the notification to show to the user.\n\n@*param* `level` — One of the values from |vim.log.levels|.\n\n@*param* `opts` — Optional parameters. Unused by default.\n\n@*return* `true` — if message was displayed, else false
	**/
	static function notify_once():Void;
	/**
		```lua\nfunction vim.on_key(fn: fun(key: string, typed: string):string?|nil, ns_id?: integer, opts?: table)\n  -> Namespace: integer\n```\n\n---\n\n Adds Lua function {fn} with namespace id {ns_id} as a listener to every,\n yes every, input key.\n\n The Nvim command-line option |-w| is related but does not support callbacks\n and cannot be toggled dynamically.\n\n           it won't be invoked for those keys.\n\n@*param* `fn` — Function invoked for every input key,\n\n          after mappings have been applied but before further processing. Arguments\n          {key} and {typed} are raw keycodes, where {key} is the key after mappings\n          are applied, and {typed} is the key(s) before mappings are applied.\n          {typed} may be empty if {key} is produced by non-typed key(s) or by the\n          same typed key(s) that produced a previous {key}.\n          If {fn} returns an empty string, {key} is discarded/ignored.\n          When {fn} is `nil`, the callback associated with namespace {ns_id} is removed.\n\n@*param* `ns_id` — Namespace ID. If nil or 0, generates and returns a\n\n                      new |nvim_create_namespace()| id.\n\n@*param* `opts` — Optional parameters\n\n\n\n@*return* `Namespace` — id associated with {fn}. Or count of all callbacks\n\nif on_key() is called without arguments.
	**/
	static function on_key():Void;
	/**
		```lua\nfunction vim.paste(lines: string[], phase: -1|1|2|3)\n  -> result: boolean\n```\n\n---\n\n Paste handler, invoked by |nvim_paste()|.\n\n Note: This is provided only as a "hook", don't call it directly; call |nvim_paste()| instead,\n which arranges redo (dot-repeat) and invokes `vim.paste`.\n\n Example: To remove ANSI color codes when pasting:\n\n ```lua\n vim.paste = (function(overridden)\n   return function(lines, phase)\n     for i,line in ipairs(lines) do\n       -- Scrub ANSI color codes from paste input.\n       lines[i] = line:gsub('\27%[[0-9;mK]+', '')\n     end\n     return overridden(lines, phase)\n   end\n end)(vim.paste)\n ```\n\n\n@*param* `lines` — |readfile()|-style list of lines to paste. |channel-lines|\n\n@*param* `phase` — -1: "non-streaming" paste: the call contains all lines.\n\n              If paste is "streamed", `phase` indicates the stream state:\n                - 1: starts the paste (exactly once)\n                - 2: continues the paste (zero or more times)\n                - 3: ends the paste (exactly once)\n\n@*return* `result` — false if client should cancel the paste.\n\n```lua\nphase:\n    | -1\n    | 1\n    | 2\n    | 3\n```
	**/
	static function paste():Void;
	/**
		```lua\nfunction vim.pesc(s: string)\n  -> string\n```\n\n---\n\n Escapes magic chars in |lua-pattern|s.\n\n@*param* `s` — String to escape\n\n@*return* — %-escaped pattern string\n\nSee: ~https~ ://github.com/rxi/lume
	**/
	static function pesc():Void;
	/**
		```lua\nfunction vim.print(...any)\n  -> any\n```\n\n---\n\n "Pretty prints" the given arguments and returns them unmodified.\n\n Example:\n\n ```lua\n local hl_normal = vim.print(vim.api.nvim_get_hl(0, { name = 'Normal' }))\n ```\n\n @see |vim.inspect()|\n @see |:=|\n\n@*return* — given arguments.
	**/
	static function print():Void;
	/**
		```lua\nfunction vim.regex(re: string)\n  -> vim.regex\n```\n\n---\n\n Parses the Vim regex `re` and returns a regex object. Regexes are "magic" and case-sensitive by\n default, regardless of 'magic' and 'ignorecase'. They can be controlled with flags, see |/magic|\n and |/ignorecase|.
	**/
	static function regex():Void;
	/**
		```lua\nfunction vim.region(bufnr: integer, pos1: string|integer[], pos2: string|integer[], regtype: string, inclusive: boolean)\n  -> region: table\n```\n\n---\n\n Gets a dict of line segment ("chunk") positions for the region from `pos1` to `pos2`.\n\n Input and output positions are byte positions, (0,0)-indexed. "End of line" column\n position (for example, |linewise| visual selection) is returned as |v:maxcol| (big number).\n\n@*param* `bufnr` — Buffer number, or 0 for current buffer\n\n@*param* `pos1` — Start of region as a (line, column) tuple or |getpos()|-compatible string\n\n@*param* `pos2` — End of region as a (line, column) tuple or |getpos()|-compatible string\n\n@*param* `regtype` — [setreg()]-style selection type\n\n@*param* `inclusive` — Controls whether the ending column is inclusive (see also 'selection').\n\n@*return* `region` — Dict of the form `{linenr = {startcol,endcol}}`. `endcol` is exclusive, and\n\nwhole lines are returned as `{startcol,endcol} = {0,-1}`.
	**/
	@:deprecated
	static function region():Void;
	/**
		```lua\nfunction vim.ringbuf(size: integer)\n  -> ringbuf: vim.Ringbuf\n```\n\n---\n\n Create a ring buffer limited to a maximal number of items.\n Once the buffer is full, adding a new entry overrides the oldest entry.\n\n ```lua\n local ringbuf = vim.ringbuf(4)\n ringbuf:push("a")\n ringbuf:push("b")\n ringbuf:push("c")\n ringbuf:push("d")\n ringbuf:push("e")    -- overrides "a"\n print(ringbuf:pop()) -- returns "b"\n print(ringbuf:pop()) -- returns "c"\n\n -- Can be used as iterator. Pops remaining items:\n for val in ringbuf do\n   print(val)\n end\n ```\n\n Returns a Ringbuf instance with the following methods:\n\n - |Ringbuf:push()|\n - |Ringbuf:pop()|\n - |Ringbuf:peek()|\n - |Ringbuf:clear()|
	**/
	static function ringbuf():Void;
	/**
		```lua\nfunction vim.rpcnotify(channel: integer, method: string, ...any)\n```\n\n---\n\n Sends {event} to {channel} via |RPC| and returns immediately. If {channel}\n is 0, the event is broadcast to all channels.\n\n This function also works in a fast callback |lua-loop-callbacks|.
	**/
	static function rpcnotify():Void;
	/**
		```lua\nfunction vim.rpcrequest(channel: integer, method: string, ...any)\n```\n\n---\n\n Sends a request to {channel} to invoke {method} via |RPC| and blocks until\n a response is received.\n\n Note: NIL values as part of the return value is represented as |vim.NIL|\n special value
	**/
	static function rpcrequest():Void;
	/**
		```lua\nfunction vim.schedule(fn: fun())\n```\n\n---\n\n Schedules {fn} to be invoked soon by the main event-loop. Useful\n to avoid |textlock| or other temporary restrictions.
	**/
	static function schedule():Void;
	/**
		```lua\nfunction vim.schedule_wrap(fn: function)\n  -> function\n```\n\n---\n\n Returns a function which calls {fn} via |vim.schedule()|.\n\n The returned function passes all arguments to {fn}.\n\n Example:\n\n ```lua\n function notify_readable(_err, readable)\n   vim.notify("readable? " .. tostring(readable))\n end\n vim.uv.fs_access(vim.fn.stdpath("config"), "R", vim.schedule_wrap(notify_readable))\n ```
	**/
	static function schedule_wrap():Void;
	/**
		```lua\nfunction vim.show_pos(bufnr?: integer, row?: integer, col?: integer, filter?: vim._inspector.Filter)\n```\n\n---\n\nShow all the items at a given buffer position.\n\nCan also be shown with `:Inspect`. [:Inspect](file:///usr/local/share/nvim/runtime/lua/vim)\n\nExample: To bind this function to the vim-scriptease\ninspired `zS` in Normal mode:\n\n```lua\nvim.keymap.set('n', 'zS', vim.show_pos)\n```\n\n@*param* `bufnr` — defaults to the current buffer\n\n@*param* `row` — row to inspect, 0-based. Defaults to the row of the current cursor\n\n@*param* `col` — col to inspect, 0-based. Defaults to the col of the current cursor
	**/
	static function show_pos():Void;
	/**
		```lua\nfunction vim.spairs(t: <T:table>)\n  -> fun(table: table<<K>, <V>>, index?: <K>):<K>, <V>\n  2. <T:table>\n```\n\n---\n\n Enumerates key-value pairs of a table, ordered by key.\n\n\n@*param* `t` — Dict-like table\n\n@*return* — |for-in| iterator over sorted keys and their values\n\n@*return*\n\nSee: ~Based~ on https://github.com/premake/premake-core/blob/master/src/base/table.lua
	**/
	static function spairs():Void;
	/**
		```lua\nfunction vim.split(s: string, sep: string, opts?: vim.gsplit.Opts)\n  -> string[]\n```\n\n---\n\n Splits a string at each instance of a separator and returns the result as a table (unlike\n |vim.gsplit()|).\n\n Examples:\n\n ```lua\n split(":aa::b:", ":")                   --> {'','aa','','b',''}\n split("axaby", "ab?")                   --> {'','x','y'}\n split("x*yz*o", "*", {plain=true})      --> {'x','yz','o'}\n split("|x|y|z|", "|", {trimempty=true}) --> {'x', 'y', 'z'}\n ```\n\n\n@*param* `s` — String to split\n\n@*param* `sep` — Separator or pattern\n\n@*param* `opts` — Keyword arguments |kwargs|:\n\n@*return* — : List of split components
	**/
	static function split():Void;
	/**
		```lua\nfunction vim.startswith(s: string, prefix: string)\n  -> boolean\n```\n\n---\n\n Tests if `s` starts with `prefix`.\n\n@*param* `s` — String\n\n@*param* `prefix` — Prefix to match\n\n@*return* — `true` if `prefix` is a prefix of `s`
	**/
	static function startswith():Void;
	/**
		```lua\nfunction vim.str_byteindex(s: string, encoding: "utf-16"|"utf-32"|"utf-8", index: integer, strict_indexing?: boolean)\n  -> integer\n```\n\n---\n\n Convert UTF-32, UTF-16 or UTF-8 {index} to byte index.\n If {strict_indexing} is false\n then then an out of range index will return byte length\n instead of throwing an error.\n\n Invalid UTF-8 and NUL is treated like in |vim.str_utfindex()|.\n An {index} in the middle of a UTF-16 sequence is rounded upwards to\n the end of that sequence.\n\n@*param* `strict_indexing` — default: true\n\n```lua\nencoding:\n    | "utf-8"\n    | "utf-16"\n    | "utf-32"\n```
	**/
	static function str_byteindex():Void;
	/**
		```lua\nfunction vim.str_utf_end(str: string, index: integer)\n  -> integer\n```\n\n---\n\n Gets the distance (in bytes) from the last byte of the codepoint (character) that {index} points\n to.\n\n Examples:\n\n ```lua\n -- The character 'æ' is stored as the bytes '\xc3\xa6' (using UTF-8)\n\n -- Returns 0 because the index is pointing at the last byte of a character\n vim.str_utf_end('æ', 2)\n\n -- Returns 1 because the index is pointing at the penultimate byte of a character\n vim.str_utf_end('æ', 1)\n ```
	**/
	static function str_utf_end():Void;
	/**
		```lua\nfunction vim.str_utf_pos(str: string)\n  -> integer[]\n```\n\n---\n\n Gets a list of the starting byte positions of each UTF-8 codepoint in the given string.\n\n Embedded NUL bytes are treated as terminating the string.
	**/
	static function str_utf_pos():Void;
	/**
		```lua\nfunction vim.str_utf_start(str: string, index: integer)\n  -> integer\n```\n\n---\n\n Gets the distance (in bytes) from the starting byte of the codepoint (character) that {index}\n points to.\n\n The result can be added to {index} to get the starting byte of a character.\n\n Examples:\n\n ```lua\n -- The character 'æ' is stored as the bytes '\xc3\xa6' (using UTF-8)\n\n -- Returns 0 because the index is pointing at the first byte of a character\n vim.str_utf_start('æ', 1)\n\n -- Returns -1 because the index is pointing at the second byte of a character\n vim.str_utf_start('æ', 2)\n ```
	**/
	static function str_utf_start():Void;
	/**
		```lua\nfunction vim.str_utfindex(s: string, encoding: "utf-16"|"utf-32"|"utf-8", index?: integer, strict_indexing?: boolean)\n  -> integer\n```\n\n---\n\n Convert byte index to UTF-32, UTF-16 or UTF-8 indices. If {index} is not\n supplied, the length of the string is used. All indices are zero-based.\n\n If {strict_indexing} is false then an out of range index will return string\n length instead of throwing an error.\n Invalid UTF-8 bytes, and embedded surrogates are counted as one code point\n each. An {index} in the middle of a UTF-8 sequence is rounded upwards to the end of\n that sequence.\n\n@*param* `strict_indexing` — default: true\n\n```lua\nencoding:\n    | "utf-8"\n    | "utf-16"\n    | "utf-32"\n```
	**/
	static function str_utfindex():Void;
	/**
		```lua\nfunction vim.stricmp(a: string, b: string)\n  -> -1|0|1\n```\n\n---\n\n Compares strings case-insensitively.\n if strings are\n equal, {a} is greater than {b} or {a} is lesser than {b}, respectively.\n\n```lua\nreturn #1:\n    | 0\n    | 1\n    | -1\n```
	**/
	static function stricmp():Void;
	/**
		```lua\nfunction vim.system(cmd: string[], opts?: vim.SystemOpts, on_exit?: fun(out: vim.SystemCompleted))\n  -> Object: vim.SystemObj\n```\n\n---\n\n TODO(lewis6991): document that the signature is system({cmd}, [{opts},] {on_exit})\n Runs a system command or throws an error if {cmd} cannot be run.\n\n Examples:\n\n ```lua\n local on_exit = function(obj)\n   print(obj.code)\n   print(obj.signal)\n   print(obj.stdout)\n   print(obj.stderr)\n end\n\n -- Runs asynchronously:\n vim.system({'echo', 'hello'}, { text = true }, on_exit)\n\n -- Runs synchronously:\n local obj = vim.system({'echo', 'hello'}, { text = true }):wait()\n -- { code = 0, signal = 0, stdout = 'hello\n', stderr = '' }\n\n ```\n\n See |uv.spawn()| for more details. Note: unlike |uv.spawn()|, vim.system\n throws an error if {cmd} cannot be run.\n\n@*param* `cmd` — Command to execute\n\n@*param* `opts` — Options:\n\n   - cwd: (string) Set the current working directory for the sub-process.\n   - env: table<string,string> Set environment variables for the new process. Inherits the\n     current environment with `NVIM` set to |v:servername|.\n   - clear_env: (boolean) `env` defines the job environment exactly, instead of merging current\n     environment. Note: if `env` is `nil`, the current environment is used but without `NVIM` set.\n   - stdin: (string|string[]|boolean) If `true`, then a pipe to stdin is opened and can be written\n     to via the `write()` method to SystemObj. If string or string[] then will be written to stdin\n     and closed. Defaults to `false`.\n   - stdout: (boolean|function)\n     Handle output from stdout. When passed as a function must have the signature `fun(err: string, data: string)`.\n     Defaults to `true`\n   - stderr: (boolean|function)\n     Handle output from stderr. When passed as a function must have the signature `fun(err: string, data: string)`.\n     Defaults to `true`.\n   - text: (boolean) Handle stdout and stderr as text. Replaces `\r\n` with `\n`.\n   - timeout: (integer) Run the command with a time limit. Upon timeout the process is sent the\n     TERM signal (15) and the exit code is set to 124.\n   - detach: (boolean) If true, spawn the child process in a detached state - this will make it\n     a process group leader, and will effectively enable the child to keep running after the\n     parent exits. Note that the child process will still keep the parent's event loop alive\n     unless the parent process calls |uv.unref()| on the child's process handle.\n\n@*param* `on_exit` — Called when subprocess exits. When provided, the command runs\n\n   asynchronously. Receives SystemCompleted object, see return of SystemObj:wait().\n\n@*return* `Object` — with the fields:\n\n   - cmd (string[]) Command name and args\n   - pid (integer) Process ID\n   - wait (fun(timeout: integer|nil): SystemCompleted) Wait for the process to complete. Upon\n     timeout the process is sent the KILL signal (9) and the exit code is set to 124. Cannot\n     be called in |api-fast|.\n     - SystemCompleted is an object with the fields:\n       - code: (integer)\n       - signal: (integer)\n       - stdout: (string), nil if stdout argument is passed\n       - stderr: (string), nil if stderr argument is passed\n   - kill (fun(signal: integer|string))\n   - write (fun(data: string|nil)) Requires `stdin=true`. Pass `nil` to close the stream.\n   - is_closing (fun(): boolean)
	**/
	static function system():Void;
	/**
		```lua\nfunction vim.tbl_add_reverse_lookup(o: table)\n  -> o: table\n```\n\n---\n\n Add the reverse lookup values to an existing table.\n For example:\n `tbl_add_reverse_lookup { A = 1 } == { [1] = 'A', A = 1 }`\n\n Note that this *modifies* the input.\n\n@*param* `o` — Table to add the reverse to
	**/
	@:deprecated
	static function tbl_add_reverse_lookup():Void;
	/**
		```lua\nfunction vim.tbl_contains(t: table, value: any, opts?: vim.tbl_contains.Opts)\n  -> boolean\n```\n\n---\n\n Checks if a table contains a given value, specified either directly or via\n a predicate that is checked for each value.\n\n Example:\n\n ```lua\n vim.tbl_contains({ 'a', { 'b', 'c' } }, function(v)\n   return vim.deep_equal(v, { 'b', 'c' })\n end, { predicate = true })\n -- true\n ```\n\n\n@*param* `t` — Table to check\n\n@*param* `value` — Value to compare or predicate function reference\n\n@*param* `opts` — Keyword arguments |kwargs|:\n\n@*return* — `true` if `t` contains `value`
	**/
	static function tbl_contains():Void;
	/**
		```lua\nfunction vim.tbl_count(t: table)\n  -> integer\n```\n\n---\n\n Counts the number of non-nil values in table `t`.\n\n ```lua\n vim.tbl_count({ a=1, b=2 })  --> 2\n vim.tbl_count({ 1, 2 })      --> 2\n ```\n\n@*param* `t` — Table\n\n@*return* — : Number of non-nil values in table\n\nSee: ~https~ ://github.com/Tieske/Penlight/blob/master/lua/pl/tablex.lua
	**/
	static function tbl_count():Void;
	/**
		```lua\nfunction vim.tbl_deep_extend(behavior: 'error'|'force'|'keep', ...<T2:table>)\n  -> <T1:table>|<T2:table>\n```\n\n---\n\n Merges recursively two or more tables.\n\n Only values that are empty tables or tables that are not |lua-list|s (indexed by consecutive\n integers starting from 1) are merged recursively. This is useful for merging nested tables\n like default and user configurations where lists should be treated as literals (i.e., are\n overwritten instead of merged).\n\n\n@*param* `behavior` — Decides what to do if a key is found in more than one map:\n\n      - "error": raise an error\n      - "keep":  use value from the leftmost map\n      - "force": use value from the rightmost map\n\n@*param* `...` — Two or more tables\n\n@*return* — (table) Merged table\n\n```lua\nbehavior:\n    | 'error'\n    | 'keep'\n    | 'force'\n```
	**/
	static function tbl_deep_extend():Void;
	/**
		```lua\nfunction vim.tbl_extend(behavior: 'error'|'force'|'keep', ...table)\n  -> table\n```\n\n---\n\n Merges two or more tables.\n\n\n@*param* `behavior` — Decides what to do if a key is found in more than one map:\n\n      - "error": raise an error\n      - "keep":  use value from the leftmost map\n      - "force": use value from the rightmost map\n\n@*param* `...` — Two or more tables\n\n@*return* — : Merged table\n\n```lua\nbehavior:\n    | 'error'\n    | 'keep'\n    | 'force'\n```
	**/
	static function tbl_extend():Void;
	/**
		```lua\nfunction vim.tbl_filter(func: fun(value: <T>):boolean, t: table<any, <T>>)\n  -> <T>[]\n```\n\n---\n\n Filter a table using a predicate function\n\n@*param* `func` — (function) Function\n\n@*param* `t` — (table) Table\n\n@*return* — : Table of filtered values
	**/
	static function tbl_filter():Void;
	/**
		```lua\nfunction vim.tbl_flatten(t: table)\n  -> Flattened: table\n```\n\n---\n\n Creates a copy of a list-like table such that any nested tables are\n "unrolled" and appended to the result.\n\n\n@*param* `t` — List-like table\n\n@*return* `Flattened` — copy of the given list-like table\n\nSee: ~From~ https://github.com/premake/premake-core/blob/master/src/base/table.lua
	**/
	@:deprecated
	static function tbl_flatten():Void;
	/**
		```lua\nfunction vim.tbl_get(o: table, ...any)\n  -> any\n```\n\n---\n\n Index into a table (first argument) via string keys passed as subsequent arguments.\n Return `nil` if the key does not exist.\n\n Examples:\n\n ```lua\n vim.tbl_get({ key = { nested_key = true }}, 'key', 'nested_key') == true\n vim.tbl_get({ key = {}}, 'key', 'nested_key') == nil\n ```\n\n@*param* `o` — Table to index\n\n@*param* `...` — Optional keys (0 or more, variadic) via which to index the table\n\n@*return* — Nested value indexed by key (if it exists), else nil
	**/
	static function tbl_get():Void;
	/**
		```lua\nfunction vim.tbl_isempty(t: table)\n  -> boolean\n```\n\n---\n\n Checks if a table is empty.\n\n\n@*param* `t` — Table to check\n\n@*return* — `true` if `t` is empty\n\nSee: ~https~ ://github.com/premake/premake-core/blob/master/src/base/table.lua
	**/
	static function tbl_isempty():Void;
	/**
		```lua\nfunction vim.tbl_islist(t: any)\n  -> boolean\n```
	**/
	@:deprecated
	static function tbl_islist():Void;
	/**
		```lua\nfunction vim.tbl_keys(t: table<<T>, any>)\n  -> <T>[]\n```\n\n---\n\n Return a list of all keys used in a table.\n However, the order of the return table of keys is not guaranteed.\n\n\n@*param* `t` — (table) Table\n\n@*return* — : List of keys\n\nSee: ~From~ https://github.com/premake/premake-core/blob/master/src/base/table.lua
	**/
	static function tbl_keys():Void;
	/**
		```lua\nfunction vim.tbl_map(func: fun(value: <T>):any, t: table<any, <T>>)\n  -> table\n```\n\n---\n\n Apply a function to all values of a table.\n\n@*param* `func` — Function\n\n@*param* `t` — Table\n\n@*return* — : Table of transformed values
	**/
	static function tbl_map():Void;
	/**
		```lua\nfunction vim.tbl_values(t: table<any, <T>>)\n  -> <T>[]\n```\n\n---\n\n Return a list of all values used in a table.\n However, the order of the return table of values is not guaranteed.\n\n@*param* `t` — (table) Table\n\n@*return* — : List of values
	**/
	static function tbl_values():Void;
	/**
		```lua\nfunction vim.trim(s: string)\n  -> String: string\n```\n\n---\n\n Trim whitespace (Lua pattern "%s") from both sides of a string.\n\n@*param* `s` — String to trim\n\n@*return* `String` — with whitespace removed from its beginning and end\n\nSee: ~https~ ://www.lua.org/pil/20.2.html
	**/
	static function trim():Void;
	/**
		```lua\nfunction vim.ui_attach(ns: integer, options: table<string, any>, callback: fun())\n```\n\n---\n\n Subscribe to |ui-events|, similar to |nvim_ui_attach()| but receive events in a Lua callback.\n Used to implement screen elements like popupmenu or message handling in Lua.\n\n {options} is a dict with one or more `ext_…` |ui-option|s set to true to enable events for\n the respective UI element.\n\n {callback} receives event name plus additional parameters. See |ui-popupmenu|\n and the sections below for event format for respective events.\n\n Callbacks for `msg_show` events are executed in |api-fast| context; showing\n the message should be scheduled.\n\n Excessive errors inside the callback will result in forced detachment.\n\n WARNING: This api is considered experimental.  Usability will vary for\n different screen elements. In particular `ext_messages` behavior is subject\n to further changes and usability improvements.  This is expected to be\n used to handle messages when setting 'cmdheight' to zero (which is\n likewise experimental).\n\n Example (stub for a |ui-popupmenu| implementation):\n\n ```lua\n ns = vim.api.nvim_create_namespace('my_fancy_pum')\n\n vim.ui_attach(ns, {ext_popupmenu=true}, function(event, ...)\n   if event == 'popupmenu_show' then\n     local items, selected, row, col, grid = ...\n     print('display pum ', #items)\n   elseif event == 'popupmenu_select' then\n     local selected = ...\n     print('selected', selected)\n   elseif event == 'popupmenu_hide' then\n     print('FIN')\n   end\n end)\n ```\n\n @since 0
	**/
	static function ui_attach():Void;
	/**
		```lua\nfunction vim.ui_detach(ns: integer)\n```\n\n---\n\n Detach a callback previously attached with |vim.ui_attach()| for the\n given namespace {ns}.
	**/
	static function ui_detach():Void;
	/**
		```lua\nfunction M.uri_from_bufnr(bufnr: integer)\n  -> URI: string\n```\n\n---\n\nGets a URI from a bufnr.
	**/
	function uri_from_bufnr():Void;
	/**
		```lua\nfunction M.uri_from_fname(path: string)\n  -> URI: string\n```\n\n---\n\nGets a URI from a file path.\n\n@*param* `path` — Path to file
	**/
	function uri_from_fname():Void;
	/**
		```lua\nfunction M.uri_to_bufnr(uri: string)\n  -> bufnr: integer\n```\n\n---\n\nGets the buffer for a uri.\nCreates a new unloaded buffer if no buffer for the uri already exists.
	**/
	function uri_to_bufnr():Void;
	/**
		```lua\nfunction M.uri_to_fname(uri: string)\n  -> filename: string\n```\n\n---\n\nGets a filename from a URI.\n\n@*return* `filename` — or unchanged URI for non-file URIs
	**/
	function uri_to_fname():Void;
	/**
		```lua\nfunction vim.validate(name: string, value: any, validator: "boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable'|("boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable')[]|fun(v: any):boolean, string?, optional?: boolean, message?: string)\n```\n\n---\n\n Validate function arguments.\n\n This function has two valid forms:\n\n 1. `vim.validate(name, value, validator[, optional][, message])`\n\n     Validates that argument {name} with value {value} satisfies\n     {validator}. If {optional} is given and is `true`, then {value} may be\n     `nil`. If {message} is given, then it is used as the expected type in the\n     error message.\n\n     Example:\n\n     ```lua\n       function vim.startswith(s, prefix)\n         vim.validate('s', s, 'string')\n         vim.validate('prefix', prefix, 'string')\n         -- ...\n       end\n     ```\n\n 2. `vim.validate(spec)` (deprecated)\n     where `spec` is of type\n    `table<string,[value:any, validator: vim.validate.Validator, optional_or_msg? : boolean|string]>)`\n\n     Validates a argument specification.\n     Specs are evaluated in alphanumeric order, until the first failure.\n\n     Example:\n\n     ```lua\n       function user.new(name, age, hobbies)\n         vim.validate{\n           name={name, 'string'},\n           age={age, 'number'},\n           hobbies={hobbies, 'table'},\n         }\n         -- ...\n       end\n     ```\n\n Examples with explicit argument values (can be run directly):\n\n ```lua\n vim.validate('arg1', {'foo'}, 'table')\n    --> NOP (success)\n vim.validate('arg2', 'foo', 'string')\n    --> NOP (success)\n\n vim.validate('arg1', 1, 'table')\n    --> error('arg1: expected table, got number')\n\n vim.validate('arg1', 3, function(a) return (a % 2) == 0 end, 'even number')\n    --> error('arg1: expected even number, got 3')\n ```\n\n If multiple types are valid they can be given as a list.\n\n ```lua\n vim.validate('arg1', {'foo'}, {'table', 'string'})\n vim.validate('arg2', 'foo', {'table', 'string'})\n -- NOP (success)\n\n vim.validate('arg1', 1, {'string', 'table'})\n -- error('arg1: expected string|table, got number')\n ```\n\n @note `validator` set to a value returned by |lua-type()| provides the\n best performance.\n\n@*param* `name` — Argument name\n\n@*param* `value` — Argument value\n\n   - (`string|string[]`): Any value that can be returned from |lua-type()| in addition to\n     `'callable'`: `'boolean'`, `'callable'`, `'function'`, `'nil'`, `'number'`, `'string'`, `'table'`,\n     `'thread'`, `'userdata'`.\n   - (`fun(val:any): boolean, string?`) A function that returns a boolean and an optional\n     string message.\n\n@*param* `optional` — Argument is optional (may be omitted)\n\n@*param* `message` — message when validation fails\n\n---\n\n```lua\nvalidator:\n    | "nil"\n    | "number"\n    | "string"\n    | "boolean"\n    | "table"\n    | "function"\n    | "thread"\n    | "userdata"\n    | 'callable'\n```\n\n---\n\n```lua\nfunction vim.validate(name: string, val: any, validator: "boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable'|("boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable')[]|fun(v: any):boolean, string?, message: string)\n```\n\n---\n\n```lua\nfunction vim.validate(spec: table<string, [any, "boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'callable'|("boolean"|"function"|"nil"|"number"|"string"|"table"|"thread"|"userdata"|'c...(too long)...|string] })\n```
	**/
	static function validate():Void;
	/**
		```lua\nfunction vim.wait(time: integer, callback?: fun():boolean, interval?: integer, fast_only?: boolean)\n  -> boolean\n  2. -1|-2|nil\n```\n\n---\n\n Wait for {time} in milliseconds until {callback} returns `true`.\n\n Executes {callback} immediately and at approximately {interval}\n milliseconds (default 200). Nvim still processes other events during\n this time.\n\n Cannot be called while in an |api-fast| event.\n\n Examples:\n\n ```lua\n ---\n -- Wait for 100 ms, allowing other events to process\n vim.wait(100, function() end)\n\n ---\n -- Wait for 100 ms or until global variable set.\n vim.wait(100, function() return vim.g.waiting_for_var end)\n\n ---\n -- Wait for 1 second or until global variable set, checking every ~500 ms\n vim.wait(1000, function() return vim.g.waiting_for_var end, 500)\n\n ---\n -- Schedule a function to set a value in 100ms\n vim.defer_fn(function() vim.g.timer_result = true end, 100)\n\n -- Would wait ten seconds if results blocked. Actually only waits  100 ms\n if vim.wait(10000, function() return vim.g.timer_result end) then\n   print('Only waiting a little bit of time!')\n end\n ```\n\n@*param* `time` — Number of milliseconds to wait\n\n@*param* `callback` — Optional callback. Waits until {callback} returns true\n\n@*param* `interval` — (Approximate) number of milliseconds to wait between polls\n\n@*param* `fast_only` — If true, only |api-fast| events will be processed.\n\n     - If {callback} returns `true` during the {time}: `true, nil`\n     - If {callback} never returns `true` during the {time}: `false, -1`\n     - If {callback} is interrupted during the {time}: `false, -2`\n     - If {callback} errors, the error is raised.\n\n```lua\nreturn #2:\n    | -1\n    | -2\n```
	**/
	static function wait():Void;
}
