package externs.module;

@:luaRequire("vim.lsp.codelens") extern class Vim_Lsp_Codelens {
	/**
		```lua
		function M.clear(client_id: integer|nil, bufnr: integer|nil)
		```
		
		---
		
		 Clear the lenses
		
		@*param* `client_id` — filter by client_id. All clients if nil
		
		@*param* `bufnr` — filter by buffer. All buffers if nil, 0 for current buffer
	**/
	extern static function clear(client_id:haxe.extern.EitherType<Int, Void>, bufnr:haxe.extern.EitherType<Int, Void>):Dynamic;
	/**
		```lua
		function M.display(lenses?: lsp.CodeLens[], bufnr: integer, client_id: integer)
		```
		
		---
		
		 Display the lenses using virtual text
		
		@*param* `lenses` — lenses to display
	**/
	extern static function display(?lenses:Array<externs.type.Lsp_CodeLens>, bufnr:Int, client_id:Int):Dynamic;
	/**
		```lua
		function M.get(bufnr: integer)
		  -> lsp.CodeLens[]
		```
		
		---
		
		 Return all lenses for the given buffer
		
		@*param* `bufnr` — Buffer number. 0 can be used for the current buffer.
	**/
	extern static function get(bufnr:Int):Array<externs.type.Lsp_CodeLens>;
	/**
		```lua
		function M.on_codelens(err?: lsp.ResponseError, result: lsp.CodeLens[], ctx: lsp.HandlerContext)
		```
		
		---
		
		 |lsp-handler| for the method `textDocument/codeLens`
	**/
	extern static function on_codelens(err:Null<externs.type.Lsp_ResponseError>, result:Array<externs.type.Lsp_CodeLens>, ctx:externs.type.Lsp_HandlerContext):Dynamic;
	/**
		```lua
		function M.refresh(opts?: vim.lsp.codelens.refresh.Opts)
		```
		
		---
		
		 Refresh the lenses.
		
		 It is recommended to trigger this using an autocmd or via keymap.
		
		 Example:
		
		 ```vim
		 autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh({ bufnr = 0 })
		 ```
		
		@*param* `opts` — Optional fields
	**/
	extern static function refresh(?opts:externs.type.Vim_Lsp_Codelens_Refresh_Opts):Dynamic;
	/**
		```lua
		function M.run()
		```
		
		---
		
		 Run the code lens in the current line
	**/
	extern static function run():Dynamic;
	/**
		```lua
		function M.save(lenses?: lsp.CodeLens[], bufnr: integer, client_id: integer)
		```
		
		---
		
		 Store lenses for a specific buffer and client
		
		@*param* `lenses` — lenses to store
	**/
	extern static function save(?lenses:Array<externs.type.Lsp_CodeLens>, bufnr:Int, client_id:Int):Dynamic;
}