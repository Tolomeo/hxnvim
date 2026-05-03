package externs.type;

/**
	```lua
	(class) vim.lsp.buf.format.Opts
	```
**/
@:native("vim.lsp.buf.format.Opts") extern class Vim_Lsp_Buf_Format_Opts {
	/**
		```lua
		(field) vim.lsp.buf.format.Opts.async: boolean?
		```
		
		---
		
		
		 If true the method won't block.
		 Editing the buffer while formatting asynchronous can lead to unexpected
		 changes.
		 (Default: false)
	**/
	extern var async : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.buf.format.Opts.bufnr: integer?
		```
		
		---
		
		
		 Restrict formatting to the clients attached to the given buffer.
		 (default: current buffer)
	**/
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.format.Opts.filter: fun(client: vim.lsp.Client):boolean??
		```
		
		---
		
		
		 Predicate used to filter clients. Receives a client as argument and must
		 return a boolean. Clients matching the predicate are included. Example:
		 ```lua
		 -- Never request typescript-language-server for formatting
		 vim.lsp.buf.format {
		   filter = function(client) return client.name ~= "ts_ls" end
		 }
		 ```
		
		---
		
		```lua
		function (client: vim.lsp.Client)
		  -> boolean?
		```
	**/
	extern var filter : Null<(client:externs.type.Vim_Lsp_Client) -> Null<Bool>>;
	/**
		```lua
		(field) vim.lsp.buf.format.Opts.formatting_options: table?
		```
		
		---
		
		 @inlinedoc
		
		 Can be used to specify FormattingOptions. Some unspecified options will be
		 automatically derived from the current Nvim options.
		 See https://microsoft.github.io/language-server-protocol/specification/#formattingOptions
	**/
	extern var formatting_options : Null<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.buf.format.Opts.id: integer?
		```
		
		---
		
		
		 Restrict formatting to the client with ID (client.id) matching this field.
	**/
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.lsp.buf.format.Opts.name: string?
		```
		
		---
		
		
		 Restrict formatting to the client with name (client.name) matching this field.
	**/
	extern var name : Null<String>;
	/**
		```lua
		(field) vim.lsp.buf.format.Opts.range: ({ start: [integer, integer], end: [integer, integer] }|{ start: [integer, integer], end: [integer, integer] }[])?
		```
		
		---
		
		
		 Range to format.
		 Table must contain `start` and `end` keys with {row,col} tuples using
		 (1,0) indexing.
		 Can also be a list of tables that contain `start` and `end` keys as described above,
		 in which case `textDocument/rangesFormatting` support is required.
		 (Default: current selection in visual mode, `nil` in other modes,
		 formatting the full buffer)
	**/
	extern var range : Null<Dynamic>;
	/**
		```lua
		(field) vim.lsp.buf.format.Opts.timeout_ms: integer?
		```
		
		---
		
		
		 Time in milliseconds to block for formatting requests. No effect if async=true.
		 (default: `1000`)
	**/
	extern var timeout_ms : Null<Int>;
}