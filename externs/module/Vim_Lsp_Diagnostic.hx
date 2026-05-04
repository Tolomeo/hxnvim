package externs.module;

@:luaRequire("vim.lsp.diagnostic") extern class Vim_Lsp_Diagnostic {
	/**
		```lua
		function M.from(diagnostics: vim.Diagnostic[])
		  -> lsp.Diagnostic[]
		```
		
		---
		
		 Converts the input `vim.Diagnostic`s to LSP diagnostics.
	**/
	extern static function from(diagnostics:Array<externs.type.Vim_Diagnostic>):Array<externs.type.Lsp_Diagnostic>;
	/**
		```lua
		function M.get_line_diagnostics(bufnr: integer|nil, line_nr: integer|nil, opts?: { severity: 1|2|3|4 }, client_id: integer|nil)
		  -> Table: table
		```
		
		---
		
		 Get the diagnostics by line
		
		 Marked private as this is used internally by the LSP subsystem, but
		 most users should instead prefer |vim.diagnostic.get()|.
		
		@*param* `bufnr` — The buffer number
		
		@*param* `line_nr` — The line number
		
		         - severity: (lsp.DiagnosticSeverity)
		             - Only return diagnostics with this severity.
		
		@*param* `client_id` — the client id
		
		@*return* `Table` — with map of line number to list of diagnostics.
		
		              Structured: { [1] = {...}, [5] = {.... } }
	**/
	extern private static function get_line_diagnostics(bufnr:haxe.extern.EitherType<Int, Void>, line_nr:haxe.extern.EitherType<Int, Void>, opts:Null<{ var severity : Null<externs.type.Lsp_DiagnosticSeverity>; }>, client_id:haxe.extern.EitherType<Int, Void>):lua.Table.AnyTable;
	/**
		```lua
		function M.get_namespace(client_id: integer, is_pull?: boolean)
		  -> integer
		```
		
		---
		
		 Get the diagnostic namespace associated with an LSP client |vim.diagnostic| for diagnostics
		
		@*param* `client_id` — The id of the LSP client
		
		@*param* `is_pull` — Whether the namespace is for a pull or push client. Defaults to push
	**/
	extern static function get_namespace(client_id:Int, is_pull:Null<Bool>):Dynamic;
	/**
		```lua
		function M.on_diagnostic(error?: lsp.ResponseError, result: lsp.RelatedFullDocumentDiagnosticReport|lsp.RelatedUnchangedDocumentDiagnosticReport, ctx: lsp.HandlerContext)
		```
		
		---
		
		 |lsp-handler| for the method "textDocument/diagnostic"
		
		 See |vim.diagnostic.config()| for configuration options.
	**/
	extern static function on_diagnostic(error:Null<externs.type.Lsp_ResponseError>, result:externs.type.Lsp_DocumentDiagnosticReport, ctx:externs.type.Lsp_HandlerContext):Dynamic;
	/**
		```lua
		function M.on_publish_diagnostics(_?: lsp.ResponseError, params: lsp.PublishDiagnosticsParams, ctx: lsp.HandlerContext)
		```
		
		---
		
		 |lsp-handler| for the method "textDocument/publishDiagnostics"
		
		 See |vim.diagnostic.config()| for configuration options.
	**/
	extern static function on_publish_diagnostics(_:Null<externs.type.Lsp_ResponseError>, params:externs.type.Lsp_PublishDiagnosticsParams, ctx:externs.type.Lsp_HandlerContext):Dynamic;
	/**
		```lua
		function M.reset(client_id: integer, buffer_client_map: table<integer, table<integer, table>>)
		```
		
		---
		
		 Clear push diagnostics and diagnostic cache.
		
		 Diagnostic producers should prefer |vim.diagnostic.reset()|. However,
		 this method signature is still used internally in some parts of the LSP
		 implementation so it's simply marked @private rather than @deprecated.
		
		@*param* `buffer_client_map` — map of buffers to active clients
	**/
	extern private static function reset(client_id:Int, buffer_client_map:lua.Table<Int, lua.Table<Int, lua.Table.AnyTable>>):Dynamic;
}