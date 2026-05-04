package externs.type;

/**
	```lua
	(class) lsp.WindowClientCapabilities
	```
**/
@:structInit extern class Lsp_WindowClientCapabilities {
	/**
		```lua
		(field) lsp.WindowClientCapabilities.showDocument: (lsp.ShowDocumentClientCapabilities)?
		```
		
		---
		
		Client capabilities for the showDocument request.
		
		
		---
		
		
		Capabilities specific to the showDocument request.
		
	**/
	extern var showDocument : Null<externs.type.Lsp_ShowDocumentClientCapabilities>;
	/**
		```lua
		(field) lsp.WindowClientCapabilities.showMessage: (lsp.ShowMessageRequestClientCapabilities)?
		```
		
		---
		
		Show message request client capabilities
		
		---
		
		
		Capabilities specific to the showMessage request.
		
	**/
	extern var showMessage : Null<externs.type.Lsp_ShowMessageRequestClientCapabilities>;
	/**
		```lua
		(field) lsp.WindowClientCapabilities.workDoneProgress: boolean?
		```
		
		---
		
		
		It indicates whether the client supports server initiated
		progress using the `window/workDoneProgress/create` request.
		
		The capability also controls Whether client supports handling
		of progress notifications. If set servers are allowed to report a
		`workDoneProgress` property in the request specific server
		capabilities.
		
	**/
	extern var workDoneProgress : Null<Bool>;
}