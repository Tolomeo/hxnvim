package externs.type;

/**
	```lua
	(class) lsp.InitializeParams
	```
**/
@:native("lsp.InitializeParams") extern class Lsp_InitializeParams {
	/**
		```lua
		(field) lsp.InitializeParams.capabilities: lsp.ClientCapabilities
		```
		
		---
		
		Defines the capabilities provided by the client.
		
		---
		
		
		The capabilities provided by the client (editor or tool)
	**/
	extern var capabilities : externs.type.Lsp_ClientCapabilities;
	/**
		```lua
		(field) lsp.InitializeParams.clientInfo: (lsp.ClientInfo)?
		```
		
		---
		
		Information about the client
		
		
		---
		
		
		Information about the client
		
	**/
	extern var clientInfo : Null<externs.type.Lsp_ClientInfo>;
	/**
		```lua
		(field) lsp.InitializeParams.initializationOptions: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		User provided initialization options.
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	extern var initializationOptions : Null<externs.type.Lsp_LSPAny>;
	/**
		```lua
		(field) lsp.InitializeParams.locale: string?
		```
		
		---
		
		
		The locale the client is currently showing the user interface
		in. This must not necessarily be the locale of the operating
		system.
		
		Uses IETF language tags as the value's syntax
		(See https://en.wikipedia.org/wiki/IETF_language_tag)
		
	**/
	extern var locale : Null<String>;
	/**
		```lua
		(field) lsp.InitializeParams.processId: integer|nil
		```
		
		---
		
		
		The process Id of the parent process that started
		the server.
		
		Is `null` if the process has not been started by another process.
		If the parent process is not alive then the server should exit.
	**/
	extern var processId : haxe.extern.EitherType<Int, externs.type.Lsp_Null>;
	/**
		```lua
		(field) lsp.InitializeParams.rootPath: (string|nil)?
		```
		
		---
		
		
		The rootPath of the workspace. Is null
		if no folder is open.
		
	**/
	extern var rootPath : Null<haxe.extern.EitherType<String, externs.type.Lsp_Null>>;
	/**
		```lua
		(field) lsp.InitializeParams.rootUri: string|nil
		```
		
		---
		
		
		The rootUri of the workspace. Is null if no
		folder is open. If both `rootPath` and `rootUri` are set
		`rootUri` wins.
		
	**/
	extern var rootUri : haxe.extern.EitherType<externs.type.Lsp_DocumentUri, externs.type.Lsp_Null>;
	/**
		```lua
		(field) lsp.InitializeParams.trace: ("messages"|"off"|"verbose")?
		```
		
		---
		
		
		The initial trace setting. If omitted trace is disabled ('off').
		
		---
		
		```lua
		lsp.TraceValue:
		    | "off" -- Off
		    | "messages" -- Messages
		    | "verbose" -- Verbose
		```
	**/
	extern var trace : Null<externs.type.Lsp_TraceValue>;
	/**
		```lua
		(field) lsp.InitializeParams.workDoneToken: (string|integer)?
		```
		
		---
		
		
		An optional token that a server can use to report work done progress.
	**/
	extern var workDoneToken : Null<externs.type.Lsp_ProgressToken>;
	/**
		```lua
		(field) lsp.InitializeParams.workspaceFolders: (lsp.WorkspaceFolder[]|nil)?
		```
		
		---
		
		
		The workspace folders configured in the client when the server starts.
		
		This property is only available if the client supports workspace folders.
		It can be `null` if the client supports workspace folders but none are
		configured.
		
	**/
	extern var workspaceFolders : Null<haxe.extern.EitherType<Array<externs.type.Lsp_WorkspaceFolder>, externs.type.Lsp_Null>>;
}