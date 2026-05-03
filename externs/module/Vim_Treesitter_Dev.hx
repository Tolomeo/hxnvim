package externs.module;

@:native("vim.treesitter.dev") extern class Vim_Treesitter_Dev {
	/**
		```lua
		function M.edit_query(lang?: string)
		  -> boolean?
		  2. error: string?
		```
		
		---
		
		@*param* `lang` — language to open the query editor for.
		
		@*return* — `true` on success, `nil` on failure
		
		@*return* `error` — message, if applicable
	**/
	extern private static function edit_query(?lang:String):vim._internal.Multireturn<Null<Bool>, Null<String>>;
	/**
		```lua
		function M.inspect_tree(opts?: vim.treesitter.dev.inspect_tree.Opts)
		```
	**/
	extern private static function inspect_tree(opts:Null<externs.type.Vim_Treesitter_Dev_InspectTree_Opts>):Dynamic;
}