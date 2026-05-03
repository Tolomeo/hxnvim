package externs.type;

/**
	```lua
	(class) vim.diagnostic.Opts
	```
	
	---
	
	 Many of the configuration options below accept one of the following:
	 - `false`: Disable this feature
	 - `true`: Enable this feature, use default settings.
	 - `table`: Enable this feature with overrides. Use an empty table to use default values.
	 - `function`: Function with signature (namespace, bufnr) that returns any of the above.
**/
@:native("vim.diagnostic.Opts") extern class Vim_Diagnostic_Opts {
	/**
		```lua
		(field) vim.diagnostic.Opts.float: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.Float|vim.diagnostic.Opts.Float)?
		```
		
		---
		
		
		 Options for floating windows. See |vim.diagnostic.Opts.Float|.
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.Float
		```
	**/
	extern var float : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Vim_Diagnostic_Opts_Float, (namespace:Int, bufnr:Int) -> externs.type.Vim_Diagnostic_Opts_Float>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.jump: (vim.diagnostic.Opts.Jump)?
		```
		
		---
		
		
		 Default values for |vim.diagnostic.jump()|. See |vim.diagnostic.Opts.Jump|.
	**/
	extern var jump : Null<externs.type.Vim_Diagnostic_Opts_Jump>;
	/**
		```lua
		(field) vim.diagnostic.Opts.severity_sort: (boolean|{ reverse: boolean })?
		```
		
		---
		
		
		 Sort diagnostics by severity. This affects the order in which signs,
		 virtual text, and highlights are displayed. When true, higher severities are
		 displayed before lower severities (e.g. ERROR is displayed before WARN).
		 Options:
		   - {reverse}? (boolean) Reverse sort order
		 (default: `false`)
	**/
	extern var severity_sort : Null<haxe.extern.EitherType<Bool, { var reverse : Null<Bool>; }>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.signs: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.Signs|vim.diagnostic.Opts.Signs)?
		```
		
		---
		
		
		 Use signs for diagnostics |diagnostic-signs|.
		 (default: `true`)
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.Signs
		```
	**/
	extern var signs : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Vim_Diagnostic_Opts_Signs, (namespace:Int, bufnr:Int) -> externs.type.Vim_Diagnostic_Opts_Signs>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.underline: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.Underline|vim.diagnostic.Opts.Underline)?
		```
		
		---
		
		
		 Use underline for diagnostics.
		 (default: `true`)
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.Underline
		```
	**/
	extern var underline : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Vim_Diagnostic_Opts_Underline, (namespace:Int, bufnr:Int) -> externs.type.Vim_Diagnostic_Opts_Underline>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.update_in_insert: boolean?
		```
		
		---
		
		
		 Update diagnostics in Insert mode
		 (if `false`, diagnostics are updated on |InsertLeave|)
		 (default: `false`)
	**/
	extern var update_in_insert : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.Opts.virtual_lines: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.VirtualLines|vim.diagnostic.Opts.VirtualLines)?
		```
		
		---
		
		
		 Use virtual lines for diagnostics.
		 (default: `false`)
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.VirtualLines
		```
	**/
	extern var virtual_lines : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Vim_Diagnostic_Opts_VirtualLines, (namespace:Int, bufnr:Int) -> externs.type.Vim_Diagnostic_Opts_VirtualLines>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.virtual_text: (boolean|fun(namespace: integer, bufnr: integer):vim.diagnostic.Opts.VirtualText|vim.diagnostic.Opts.VirtualText)?
		```
		
		---
		
		
		 Use virtual text for diagnostics. If multiple diagnostics are set for a
		 namespace, one prefix per diagnostic + the last diagnostic message are
		 shown.
		 (default: `false`)
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		  -> vim.diagnostic.Opts.VirtualText
		```
	**/
	extern var virtual_text : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Vim_Diagnostic_Opts_VirtualText, (namespace:Int, bufnr:Int) -> externs.type.Vim_Diagnostic_Opts_VirtualText>>>;
}