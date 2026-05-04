package externs.type;

/**
	```lua
	(class) lsp.TextDocumentSyncOptions
	```
**/
extern class Lsp_TextDocumentSyncOptions {
	/**
		```lua
		(field) lsp.TextDocumentSyncOptions.change: (0|1|2)?
		```
		
		---
		
		Defines how the host (editor) should sync
		document changes to the language server.
		
		---
		
		
		Change notifications are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Full
		and TextDocumentSyncKind.Incremental. If omitted it defaults to TextDocumentSyncKind.None.
		
		---
		
		```lua
		-- Defines how the host (editor) should sync
		-- document changes to the language server.
		lsp.TextDocumentSyncKind:
		    | 0 -- None
		    | 1 -- Full
		    | 2 -- Incremental
		```
	**/
	extern var change : Null<externs.type.Lsp_TextDocumentSyncKind>;
	/**
		```lua
		(field) lsp.TextDocumentSyncOptions.openClose: boolean?
		```
		
		---
		
		
		Open and close notifications are sent to the server. If omitted open close notification should not
		be sent.
	**/
	extern var openClose : Null<Bool>;
	/**
		```lua
		(field) lsp.TextDocumentSyncOptions.save: (boolean|lsp.SaveOptions)?
		```
		
		---
		
		Save options.
		
		---
		
		
		If present save notifications are sent to the server. If omitted the notification should not be
		sent.
	**/
	extern var save : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_SaveOptions>>;
	/**
		```lua
		(field) lsp.TextDocumentSyncOptions.willSave: boolean?
		```
		
		---
		
		
		If present will save notifications are sent to the server. If omitted the notification should not be
		sent.
	**/
	extern var willSave : Null<Bool>;
	/**
		```lua
		(field) lsp.TextDocumentSyncOptions.willSaveWaitUntil: boolean?
		```
		
		---
		
		
		If present will save wait until requests are sent to the server. If omitted the request should not be
		sent.
	**/
	extern var willSaveWaitUntil : Null<Bool>;
}