package externs.module;

@:native("vim.lsp.handlers") extern class Vim_Lsp_Handlers {
	/**
		```lua
		(global) vim.lsp.handlers.hover: fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown
		```
		
		---
		
		 |lsp-handler| for the method "textDocument/hover"
		
		 ```lua
		 vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		   vim.lsp.handlers.hover, {
		     -- Use a sharp border with `FloatBorder` highlights
		     border = "single",
		     -- add the title in hover float window
		     title = "hover"
		   }
		 )
		 ```
		
		@*param* `config` — Configuration table.
		
		     - border:     (default=nil)
		         - Add borders to the floating window
		         - See |vim.lsp.util.open_floating_preview()| for more options.
		
		---
		
		```lua
		function (err: (lsp.ResponseError)?, result: any, context: lsp.HandlerContext, config?: table)
		  -> ...unknown
		```
	**/
	@:deprecated
	extern static function hover(_:Null<externs.type.Lsp_ResponseError>, result:externs.type.Lsp_Hover, ctx:externs.type.Lsp_HandlerContext, config:lua.Table.AnyTable):Dynamic;
	/**
		```lua
		(global) vim.lsp.handlers.signature_help: fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown
		```
		
		---
		
		 |lsp-handler| for the method "textDocument/signatureHelp".
		
		 The active parameter is highlighted with |hl-LspSignatureActiveParameter|.
		
		 ```lua
		 vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		   vim.lsp.handlers.signature_help, {
		     -- Use a sharp border with `FloatBorder` highlights
		     border = "single"
		   }
		 )
		 ```
		
		@*param* `result` — Response from the language server
		
		@*param* `ctx` — Client context
		
		@*param* `config` — Configuration table.
		
		     - border:     (default=nil)
		         - Add borders to the floating window
		         - See |vim.lsp.util.open_floating_preview()| for more options
		
		---
		
		```lua
		function (err: (lsp.ResponseError)?, result: any, context: lsp.HandlerContext, config?: table)
		  -> ...unknown
		```
	**/
	@:deprecated
	extern static function signature_help(_:Null<externs.type.Lsp_ResponseError>, result:Null<externs.type.Lsp_SignatureHelp>, ctx:externs.type.Lsp_HandlerContext, config:lua.Table.AnyTable):Dynamic;
}