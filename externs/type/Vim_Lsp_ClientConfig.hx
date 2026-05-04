package externs.type;

/**
	```lua
	(class) vim.lsp.ClientConfig
	```
**/
@:structInit extern class Vim_Lsp_ClientConfig {
	/**
		```lua
		(field) vim.lsp.ClientConfig.before_init: fun(params: lsp.InitializeParams, config: vim.lsp.ClientConfig)?
		```
		
		---
		
		
		 Callback invoked before the LSP "initialize" phase, where `params` contains the parameters
		 being sent to the server and `config` is the config that was passed to |vim.lsp.start()|.
		 You can use this to modify parameters before they are sent.
		
		---
		
		```lua
		function (params: lsp.InitializeParams, config: vim.lsp.ClientConfig)
		```
	**/
	extern var before_init : Null<(params:externs.type.Lsp_InitializeParams, config:externs.type.Vim_Lsp_ClientConfig) -> Dynamic>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.capabilities: (lsp.ClientCapabilities)?
		```
		
		---
		
		Defines the capabilities provided by the client.
		
		---
		
		 Map overriding the default capabilities defined by |vim.lsp.protocol.make_client_capabilities()|,
		 passed to the language server on initialization. Hint: use make_client_capabilities() and modify
		 its result.
		 - Note: To send an empty dictionary use |vim.empty_dict()|, else it will be encoded as an
		   array.
	**/
	extern var capabilities : Null<externs.type.Lsp_ClientCapabilities>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.cmd: fun(dispatchers: vim.lsp.rpc.Dispatchers, config: vim.lsp.ClientConfig):vim.lsp.rpc.PublicClient|string[]
		```
		
		---
		
		
		 Command `string[]` that launches the language server (treated as in |jobstart()|, must be
		 absolute or on `$PATH`, shell constructs like "~" are not expanded), or function that creates an
		 RPC client. Function receives a `dispatchers` table and the resolved `config`, and must return
		 a table with member functions `request`, `notify`, `is_closing` and `terminate`.
		 See |vim.lsp.rpc.request()|, |vim.lsp.rpc.notify()|.
		 For TCP there is a builtin RPC client factory: |vim.lsp.rpc.connect()|
		
		---
		
		```lua
		function (dispatchers: vim.lsp.rpc.Dispatchers, config: vim.lsp.ClientConfig)
		  -> vim.lsp.rpc.PublicClient
		```
	**/
	extern var cmd : haxe.extern.EitherType<Array<String>, (dispatchers:externs.type.Vim_Lsp_Rpc_Dispatchers, config:externs.type.Vim_Lsp_ClientConfig) -> externs.type.Vim_Lsp_Rpc_PublicClient>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.cmd_cwd: string?
		```
		
		---
		
		
		 Directory to launch the `cmd` process. Not related to `root_dir`.
		 (default: cwd)
	**/
	extern var cmd_cwd : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.cmd_env: table?
		```
		
		---
		
		
		 Environment variables passed to the LSP process on spawn. Non-string values are coerced to
		 string.
		 Example:
		 ```lua
		 { PORT = 8080; HOST = '0.0.0.0'; }
		 ```
	**/
	extern var cmd_env : Null<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.commands: table<string, fun(command: lsp.Command, ctx: table)>?
		```
		
		---
		
		
		 Client commands. Map of command names to user-defined functions. Commands passed to `start()`
		 take precedence over the global command registry. Each key must be a unique command name, and
		 the value is a function which is called if any LSP action (code action, code lenses, …) triggers
		 the command.
	**/
	extern var commands : Null<lua.Table<String, (command:externs.type.Lsp_Command, ctx:lua.Table.AnyTable) -> Dynamic>>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.detached: boolean?
		```
		
		---
		
		
		 Daemonize the server process so that it runs in a separate process group from Nvim.
		 Nvim will shutdown the process on exit, but if Nvim fails to exit cleanly this could leave
		 behind orphaned server processes.
		 (default: `true`)
	**/
	extern var detached : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.flags: (vim.lsp.Client.Flags)?
		```
		
		---
		
		
		 A table with flags for the client. The current (experimental) flags are:
	**/
	extern var flags : Null<externs.type.Vim_Lsp_Client_Flags>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.get_language_id: (fun(bufnr: integer, filetype: string):string)?
		```
		
		---
		
		
		 Language ID as string. Defaults to the buffer filetype.
		
		---
		
		```lua
		function (bufnr: integer, filetype: string)
		  -> string
		```
	**/
	extern var get_language_id : Null<(bufnr:Int, filetype:String) -> String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.handlers: table<string, function>?
		```
		
		---
		
		
		 Map of LSP method names to |lsp-handler|s.
	**/
	extern var handlers : Null<lua.Table<String, haxe.Constraints.Function>>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.init_options: table<string, boolean|string|number|unknown[]|nil>?
		```
		
		---
		
		LSP object definition.
		
		---
		
		
		 Values to pass in the initialization request as `initializationOptions`. See `initialize` in
		 the LSP spec.
	**/
	extern var init_options : Null<externs.type.Lsp_LSPObject>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.name: string?
		```
		
		---
		
		
		 Name in logs and user messages.
		 (default: client-id)
	**/
	extern var name : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.offset_encoding: ('utf-16'|'utf-32'|'utf-8')?
		```
		
		---
		
		
		 Called "position encoding" in LSP spec. The encoding that the LSP server expects, used for
		 communication. Not validated. Can be modified in `on_init` before text is sent to the server.
	**/
	extern var offset_encoding : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.on_attach: elem_or_list<fun(client: vim.lsp.Client, bufnr: integer)>?
		```
		
		---
		
		
		 Callback invoked when client attaches to a buffer.
		
		---
		
		```lua
		function (client: vim.lsp.Client, bufnr: integer)
		```
	**/
	extern var on_attach : Null<externs.type.ElemOrList>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.on_error: fun(code: integer, err: string)?
		```
		
		---
		
		
		 Callback invoked when the client operation throws an error. `code` is a number describing the error.
		 Other arguments may be passed depending on the error kind.  See `vim.lsp.rpc.client_errors`
		 for possible errors. Use `vim.lsp.rpc.client_errors[code]` to get human-friendly name.
		
		---
		
		```lua
		function (code: integer, err: string)
		```
	**/
	extern var on_error : Null<(code:Int, err:String) -> Dynamic>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.on_exit: elem_or_list<fun(code: integer, signal: integer, client_id: integer)>?
		```
		
		---
		
		 Callback invoked on client exit.
		   - code: exit code of the process
		   - signal: number describing the signal used to terminate (if any)
		   - client_id: client handle
		
		---
		
		```lua
		function (code: integer, signal: integer, client_id: integer)
		```
	**/
	extern var on_exit : Null<externs.type.ElemOrList>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.on_init: elem_or_list<fun(client: vim.lsp.Client, init_result: lsp.InitializeResult)>?
		```
		
		---
		
		
		 Callback invoked after LSP "initialize", where `result` is a table of `capabilities` and
		 anything else the server may send. For example, clangd sends `init_result.offsetEncoding` if
		 `capabilities.offsetEncoding` was sent to it. You can only modify the `client.offset_encoding`
		 here before any notifications are sent.
		
		---
		
		```lua
		function (client: vim.lsp.Client, init_result: lsp.InitializeResult)
		```
	**/
	extern var on_init : Null<externs.type.ElemOrList>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.root_dir: string?
		```
		
		---
		
		
		 Directory where the LSP server will base its workspaceFolders, rootUri, and rootPath on initialization.
	**/
	extern var root_dir : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.settings: table<string, boolean|string|number|unknown[]|nil>?
		```
		
		---
		
		LSP object definition.
		
		---
		
		
		 Map of language server-specific settings, decided by the client. Sent to the LS if requested via
		 `workspace/configuration`. Keys are case-sensitive.
	**/
	extern var settings : Null<externs.type.Lsp_LSPObject>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.trace: ('messages'|'off'|'verbose')?
		```
		
		---
		
		
		 Passed directly to the language server in the initialize request. Invalid/empty values will
		 (default: "off")
	**/
	extern var trace : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.workspace_folders: lsp.WorkspaceFolder[]?
		```
		
		---
		
		
		 List of workspace folders passed to the language server. For backwards compatibility rootUri and
		 rootPath are derived from the first workspace folder in this list. Can be `null` if the client
		 supports workspace folders but none are configured. See `workspaceFolders` in LSP spec.
	**/
	extern var workspace_folders : Null<Array<externs.type.Lsp_WorkspaceFolder>>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.workspace_required: boolean?
		```
		
		---
		
		
		 Server requires a workspace (no "single file" support). Note: Without
		 a workspace, cross-file features (navigation, hover) may or may not work depending on the
		 language server, even if the server doesn't require a workspace.
		 (default: `false`)
	**/
	extern var workspace_required : Null<Bool>;
}