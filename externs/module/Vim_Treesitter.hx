package externs.module;

@:native("vim.treesitter") extern class Vim_Treesitter {
	/**
		```lua
		(global) vim.treesitter.dev: table
		```
	**/
	extern var dev : externs.module.Vim_Treesitter_Dev;
	/**
		```lua
		function M.foldexpr(lnum: integer|nil)
		  -> string
		```
		
		---
		
		 Returns the fold level for {lnum} in the current buffer. Can be set directly to 'foldexpr':
		
		 ```lua
		 vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		 ```
		
		@*param* `lnum` — Line number to calculate fold level for
	**/
	extern static function foldexpr(lnum:haxe.extern.EitherType<Int, Void>):String;
	/**
		```lua
		function M.get_captures_at_cursor(winnr: integer|nil)
		  -> List: string[]
		```
		
		---
		
		 Returns a list of highlight capture names under the cursor
		
		@*param* `winnr` — : |window-ID| or 0 for current window (default)
		
		
		@*return* `List` — of capture names
	**/
	extern static function get_captures_at_cursor(winnr:haxe.extern.EitherType<Int, Void>):Array<String>;
	/**
		```lua
		function M.get_captures_at_pos(bufnr: integer, row: integer, col: integer)
		  -> { capture: string, lang: string, metadata: vim.treesitter.query.TSMetadata, id: integer }[]
		```
		
		---
		
		 Returns a list of highlight captures at the given position
		
		 Each capture is represented by a table containing the capture name as a string, the capture's
		 language, a table of metadata (`priority`, `conceal`, ...; empty if none are defined), and the
		 id of the capture.
		
		@*param* `bufnr` — Buffer number (0 for current buffer)
		
		@*param* `row` — Position row
		
		@*param* `col` — Position column
	**/
	extern static function get_captures_at_pos(bufnr:Int, row:Int, col:Int):Array<{ var capture : String; var lang : String; var metadata : externs.type.Vim_Treesitter_Query_TSMetadata; var id : Int; }>;
	/**
		```lua
		function M.get_node(opts?: vim.treesitter.get_node.Opts)
		  -> Node: TSNode|nil
		```
		
		---
		
		 Returns the smallest named node at the given position
		
		 NOTE: Calling this on an unparsed tree can yield an invalid node.
		 If the tree is not known to be parsed by, e.g., an active highlighter,
		 parse the tree first via
		
		 ```lua
		 vim.treesitter.get_parser(bufnr):parse(range)
		 ```
		
		
		@*return* `Node` — at the given position
	**/
	extern static function get_node(opts:Null<externs.type.Vim_Treesitter_GetNode_Opts>):haxe.extern.EitherType<externs.type.TSNode, Void>;
	/**
		```lua
		function M.get_node_range(node_or_range: Range4|TSNode)
		  -> start_row: integer
		  2. start_col: integer
		  3. end_row: integer
		  4. end_col: integer
		```
		
		---
		
		 Returns the node's range or an unpacked range table
		
		@*param* `node_or_range` — Node or table of positions
	**/
	extern static function get_node_range(node_or_range:haxe.extern.EitherType<externs.type.TSNode, externs.type.Range4>):vim._internal.Multireturn<Int, Int, Int, Int>;
	/**
		```lua
		function M.get_node_text(node: TSNode, source: string|integer, opts: table|nil)
		  -> string
		```
		
		---
		
		 Gets the text corresponding to a given node
		
		@*param* `source` — Buffer or string from which the {node} is extracted
		
		@*param* `opts` — Optional parameters.
		
		          - metadata (table) Metadata of a specific capture. This would be
		            set to `metadata[capture_id]` when using |vim.treesitter.query.add_directive()|.
	**/
	extern static function get_node_text(node:externs.type.TSNode, source:haxe.extern.EitherType<Int, String>, opts:haxe.extern.EitherType<lua.Table.AnyTable, Void>):String;
	/**
		```lua
		function M.get_parser(bufnr: integer|nil, lang: string|nil, opts: table|nil)
		  -> object: (vim.treesitter.LanguageTree)?
		  2. error: string?
		```
		
		---
		
		 Returns the parser for a specific buffer and attaches it to the buffer
		
		 If needed, this will create the parser.
		
		 If no parser can be created, an error is thrown. Set `opts.error = false` to suppress this and
		 return nil (and an error message) instead. WARNING: This behavior will become default in Nvim
		 0.12 and the option will be removed.
		
		@*param* `bufnr` — Buffer the parser should be tied to (default: current buffer)
		
		@*param* `lang` — Language of this parser (default: from buffer filetype)
		
		@*param* `opts` — Options to pass to the created language tree
		
		
		@*return* `object` — to use for parsing
		
		@*return* `error` — message, if applicable
	**/
	extern static function get_parser(bufnr:haxe.extern.EitherType<Int, Void>, lang:haxe.extern.EitherType<String, Void>, opts:haxe.extern.EitherType<lua.Table.AnyTable, Void>):vim._internal.Multireturn<Null<externs.type.Vim_Treesitter_LanguageTree>, Null<String>>;
	/**
		```lua
		function M.get_range(node: TSNode, source: string|integer|nil, metadata: vim.treesitter.query.TSMetadata|nil)
		  -> Range6
		```
		
		---
		
		Get the range of a |TSNode|. Can also supply {source} and {metadata}
		to get the range with directives applied.
		
		@*param* `source` — Buffer or string from which the {node} is extracted
	**/
	extern static function get_range(node:externs.type.TSNode, source:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, Void>>, metadata:haxe.extern.EitherType<externs.type.Vim_Treesitter_Query_TSMetadata, Void>):externs.type.Range6;
	/**
		```lua
		function M.get_string_parser(str: string, lang: string, opts: table|nil)
		  -> object: vim.treesitter.LanguageTree
		```
		
		---
		
		 Returns a string parser
		
		@*param* `str` — Text to parse
		
		@*param* `lang` — Language of this string
		
		@*param* `opts` — Options to pass to the created language tree
		
		
		@*return* `object` — to use for parsing
	**/
	extern static function get_string_parser(str:String, lang:String, opts:haxe.extern.EitherType<lua.Table.AnyTable, Void>):externs.type.Vim_Treesitter_LanguageTree;
	/**
		```lua
		(global) vim.treesitter.highlighter: vim.treesitter.highlighter
		```
	**/
	extern var highlighter : externs.module.Vim_Treesitter_Highlighter;
	/**
		```lua
		function M.inspect_tree(opts: table|nil)
		```
		
		---
		
		 Open a window that displays a textual representation of the nodes in the language tree.
		
		 While in the window, press "a" to toggle display of anonymous nodes, "I" to toggle the
		 display of the source language of each node, "o" to toggle the query editor, and press
		 [<Enter>] to jump to the node under the cursor in the source buffer. Folding also works
		 (try |zo|, |zc|, etc.).
		
		 Can also be shown with `:InspectTree`. [:InspectTree](file:///usr/local/share/nvim/runtime/lua/vim)
		
		@*param* `opts` — Optional options table with the following possible keys:
		
		                      - lang (string|nil): The language of the source buffer. If omitted, detect
		                        from the filetype of the source buffer.
		                      - bufnr (integer|nil): Buffer to draw the tree into. If omitted, a new
		                        buffer is created.
		                      - winid (integer|nil): Window id to display the tree buffer in. If omitted,
		                        a new window is created with {command}.
		                      - command (string|nil): Vimscript command to create the window. Default
		                        value is "60vnew". Only used when {winid} is nil.
		                      - title (string|fun(bufnr:integer):string|nil): Title of the window. If a
		                        function, it accepts the buffer number of the source buffer as its only
		                        argument and should return a string.
	**/
	extern static function inspect_tree(opts:haxe.extern.EitherType<lua.Table.AnyTable, Void>):Dynamic;
	/**
		```lua
		function M.is_ancestor(dest: TSNode, source: TSNode)
		  -> True: boolean
		```
		
		---
		
		 Determines whether a node is the ancestor of another
		
		@*param* `dest` — Possible ancestor
		
		@*param* `source` — Possible descendant
		
		
		@*return* `True` — if {dest} is an ancestor of {source}
	**/
	extern static function is_ancestor(dest:externs.type.TSNode, source:externs.type.TSNode):Bool;
	/**
		```lua
		function M.is_in_node_range(node: TSNode, line: integer, col: integer)
		  -> True: boolean
		```
		
		---
		
		 Determines whether (line, col) position is in node range
		
		@*param* `node` — defining the range
		
		@*param* `line` — Line (0-based)
		
		@*param* `col` — Column (0-based)
		
		
		@*return* `True` — if the position is in node range
	**/
	extern static function is_in_node_range(node:externs.type.TSNode, line:Int, col:Int):Bool;
	/**
		```lua
		(global) vim.treesitter.language: table
		```
	**/
	extern var language : externs.module.Vim_Treesitter_Language;
	/**
		```lua
		(global) vim.treesitter.language_version: integer
		```
		
		---
		
		 @nodoc
	**/
	extern var language_version : Int;
	/**
		```lua
		(global) vim.treesitter.languagetree: vim.treesitter.LanguageTree
		```
	**/
	extern var languagetree : externs.module.Vim_Treesitter_Languagetree;
	/**
		```lua
		(global) vim.treesitter.minimum_language_version: integer
		```
		
		---
		
		 @nodoc
	**/
	extern var minimum_language_version : Int;
	/**
		```lua
		function M.node_contains(node: TSNode, range: table)
		  -> True: boolean
		```
		
		---
		
		 Determines if a node contains a range
		
		
		@*return* `True` — if the {node} contains the {range}
	**/
	extern static function node_contains(node:externs.type.TSNode, range:lua.Table.AnyTable):Bool;
	/**
		```lua
		(global) vim.treesitter.query: table
		```
	**/
	extern var query : externs.module.Vim_Treesitter_Query;
	/**
		```lua
		function M.start(bufnr?: integer, lang?: string)
		```
		
		---
		
		 Starts treesitter highlighting for a buffer
		
		 Can be used in an ftplugin or FileType autocommand.
		
		 Note: By default, disables regex syntax highlighting, which may be required for some plugins.
		 In this case, add `vim.bo.syntax = 'on'` after the call to `start`.
		
		 Note: By default, the highlighter parses code asynchronously, using a segment time of 3ms.
		
		 Example:
		
		 ```lua
		 vim.api.nvim_create_autocmd( 'FileType', { pattern = 'tex',
		     callback = function(args)
		         vim.treesitter.start(args.buf, 'latex')
		         vim.bo[args.buf].syntax = 'on'  -- only if additional legacy syntax is needed
		     end
		 })
		 ```
		
		@*param* `bufnr` — Buffer to be highlighted (default: current buffer)
		
		@*param* `lang` — Language of the parser (default: from buffer filetype)
	**/
	extern static function start(bufnr:Null<Int>, lang:Null<String>):Dynamic;
	/**
		```lua
		function M.stop(bufnr: integer|nil)
		```
		
		---
		
		 Stops treesitter highlighting for a buffer
		
		@*param* `bufnr` — Buffer to stop highlighting (default: current buffer)
	**/
	extern static function stop(bufnr:haxe.extern.EitherType<Int, Void>):Dynamic;
}