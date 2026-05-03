package externs.module;

@:native("vim.treesitter.language") extern class Vim_Treesitter_Language {
	/**
		```lua
		function M.add(lang: string, opts?: vim.treesitter.language.add.Opts)
		  -> True: boolean?
		  2. Error: string?
		```
		
		---
		
		 Load parser with name {lang}
		
		 Parsers are searched in the `parser` runtime directory, or the provided {path}.
		 Can be used to check for available parsers before enabling treesitter features, e.g.,
		 ```lua
		   if vim.treesitter.language.add('markdown') then
		     vim.treesitter.start(bufnr, 'markdown')
		   end
		 ```
		
		@*param* `lang` — Name of the parser (alphanumerical and `_` only)
		
		@*param* `opts` — Options:
		
		@*return* `True` — if parser is loaded
		
		@*return* `Error` — if parser cannot be loaded
	**/
	extern static function add(lang:String, ?opts:externs.type.Vim_Treesitter_Language_Add_Opts):vim._internal.Multireturn<Null<Bool>, Null<String>>;
	/**
		```lua
		function M.get_filetypes(lang: string)
		  -> filetypes: string[]
		```
		
		---
		
		 Returns the filetypes for which a parser named {lang} is used.
		
		 The list includes {lang} itself plus all filetypes registered via
		 |vim.treesitter.language.register()|.
		
		@*param* `lang` — Name of parser
	**/
	extern static function get_filetypes(lang:String):Array<String>;
	/**
		```lua
		function M.get_lang(filetype: string)
		  -> string|nil
		```
		
		---
		
		 Returns the language name to be used when loading a parser for {filetype}.
		
		 If no language has been explicitly registered via |vim.treesitter.language.register()|,
		 default to {filetype}. For composite filetypes like `html.glimmer`, only the main filetype is
		 returned.
	**/
	extern static function get_lang(filetype:String):haxe.extern.EitherType<String, Void>;
	/**
		```lua
		function M.inspect(lang: string)
		  -> TSLangInfo
		```
		
		---
		
		 Inspects the provided language.
		
		 Inspecting provides some useful information on the language like ABI version, parser state count
		 (a measure of parser complexity), node and field names, and whether the language came from a
		 WASM module.
		
		 Node names are returned in a table mapping each node name to a `boolean` indicating whether or
		 not the node is named (i.e., not anonymous). Anonymous nodes are surrounded with double quotes
		 (`"`).
		
		 For ABI 15 parsers, also show parser metadata (major, minor, patch version) and a table of
		 supertypes with their respective subtypes.
		
		@*param* `lang` — Language
	**/
	extern static function inspect(lang:String):externs.type.TSLangInfo;
	/**
		```lua
		function M.register(lang: string, filetype: string|string[])
		```
		
		---
		
		 Register a parser named {lang} to be used for {filetype}(s).
		
		 Note: this adds or overrides the mapping for {filetype}, any existing mappings from other
		 filetypes to {lang} will be preserved.
		
		@*param* `lang` — Name of parser
		
		@*param* `filetype` — Filetype(s) to associate with lang
	**/
	extern static function register(lang:String, filetype:haxe.extern.EitherType<String, Array<String>>):Dynamic;
	/**
		```lua
		function M.require_language(lang: any, path: any, silent: any, symbol_name: any)
		  -> boolean
		  2. string|nil
		```
	**/
	@:deprecated
	extern static function require_language(lang:Dynamic, path:Dynamic, silent:Dynamic, symbol_name:Dynamic):Dynamic;
}