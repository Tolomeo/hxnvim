package externs.type;

/**
	```lua
	(class) lsp.ClientCapabilities
	```
	
	---
	
	Defines the capabilities provided by the client.
**/
@:native("lsp.ClientCapabilities") extern class Lsp_ClientCapabilities {
	/**
		```lua
		(field) lsp.ClientCapabilities.experimental: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		Experimental client capabilities.
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	extern var experimental : Null<externs.type.Lsp_LSPAny>;
	/**
		```lua
		(field) lsp.ClientCapabilities.general: (lsp.GeneralClientCapabilities)?
		```
		
		---
		
		General client capabilities.
		
		
		---
		
		
		General client capabilities.
		
	**/
	extern var general : Null<externs.type.Lsp_GeneralClientCapabilities>;
	/**
		```lua
		(field) lsp.ClientCapabilities.notebookDocument: (lsp.NotebookDocumentClientCapabilities)?
		```
		
		---
		
		Capabilities specific to the notebook document support.
		
		
		---
		
		
		Capabilities specific to the notebook document support.
		
	**/
	extern var notebookDocument : Null<externs.type.Lsp_NotebookDocumentClientCapabilities>;
	/**
		```lua
		(field) lsp.ClientCapabilities.textDocument: (lsp.TextDocumentClientCapabilities)?
		```
		
		---
		
		Text document specific client capabilities.
		
		---
		
		
		Text document specific client capabilities.
	**/
	extern var textDocument : Null<externs.type.Lsp_TextDocumentClientCapabilities>;
	/**
		```lua
		(field) lsp.ClientCapabilities.window: (lsp.WindowClientCapabilities)?
		```
		
		---
		
		
		Window specific client capabilities.
	**/
	extern var window : Null<externs.type.Lsp_WindowClientCapabilities>;
	/**
		```lua
		(field) lsp.ClientCapabilities.workspace: (lsp.WorkspaceClientCapabilities)?
		```
		
		---
		
		Workspace specific client capabilities.
		
		---
		
		
		Workspace specific client capabilities.
	**/
	extern var workspace : Null<externs.type.Lsp_WorkspaceClientCapabilities>;
}