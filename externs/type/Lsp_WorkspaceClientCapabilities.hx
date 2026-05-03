package externs.type;

/**
	```lua
	(class) lsp.WorkspaceClientCapabilities
	```
	
	---
	
	Workspace specific client capabilities.
**/
@:native("lsp.WorkspaceClientCapabilities") extern class Lsp_WorkspaceClientCapabilities {
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.applyEdit: boolean?
		```
		
		---
		
		
		The client supports applying batch edits
		to the workspace by supporting the request
		'workspace/applyEdit'
	**/
	extern var applyEdit : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.codeLens: (lsp.CodeLensWorkspaceClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the code lens requests scoped to the
		workspace.
		
	**/
	extern var codeLens : Null<externs.type.Lsp_CodeLensWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.configuration: boolean?
		```
		
		---
		
		
		The client supports `workspace/configuration` requests.
		
	**/
	extern var configuration : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.diagnostics: (lsp.DiagnosticWorkspaceClientCapabilities)?
		```
		
		---
		
		Workspace client capabilities specific to diagnostic pull requests.
		
		
		---
		
		
		Capabilities specific to the diagnostic requests scoped to the
		workspace.
		
	**/
	extern var diagnostics : Null<externs.type.Lsp_DiagnosticWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.didChangeConfiguration: (lsp.DidChangeConfigurationClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `workspace/didChangeConfiguration` notification.
	**/
	extern var didChangeConfiguration : Null<externs.type.Lsp_DidChangeConfigurationClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.didChangeWatchedFiles: (lsp.DidChangeWatchedFilesClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
	**/
	extern var didChangeWatchedFiles : Null<externs.type.Lsp_DidChangeWatchedFilesClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.executeCommand: (lsp.ExecuteCommandClientCapabilities)?
		```
		
		---
		
		The client capabilities of a {@link ExecuteCommandRequest}.
		
		---
		
		
		Capabilities specific to the `workspace/executeCommand` request.
	**/
	extern var executeCommand : Null<externs.type.Lsp_ExecuteCommandClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.fileOperations: (lsp.FileOperationClientCapabilities)?
		```
		
		---
		
		Capabilities relating to events from file operations by the user in the client.
		
		These events do not come from the file system, they come from user operations
		like renaming a file in the UI.
		
		
		---
		
		
		The client has support for file notifications/requests for user operations on files.
		
		Since 3.16.0
	**/
	extern var fileOperations : Null<externs.type.Lsp_FileOperationClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.foldingRange: (lsp.FoldingRangeWorkspaceClientCapabilities)?
		```
		
		---
		
		Client workspace capabilities specific to folding ranges
		
		
		---
		
		
		Capabilities specific to the folding range requests scoped to the workspace.
		
	**/
	extern var foldingRange : Null<externs.type.Lsp_FoldingRangeWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.inlayHint: (lsp.InlayHintWorkspaceClientCapabilities)?
		```
		
		---
		
		Client workspace capabilities specific to inlay hints.
		
		
		---
		
		
		Capabilities specific to the inlay hint requests scoped to the
		workspace.
		
	**/
	extern var inlayHint : Null<externs.type.Lsp_InlayHintWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.inlineValue: (lsp.InlineValueWorkspaceClientCapabilities)?
		```
		
		---
		
		Client workspace capabilities specific to inline values.
		
		
		---
		
		
		Capabilities specific to the inline values requests scoped to the
		workspace.
		
	**/
	extern var inlineValue : Null<externs.type.Lsp_InlineValueWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.semanticTokens: (lsp.SemanticTokensWorkspaceClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the semantic token requests scoped to the
		workspace.
		
	**/
	extern var semanticTokens : Null<externs.type.Lsp_SemanticTokensWorkspaceClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.symbol: (lsp.WorkspaceSymbolClientCapabilities)?
		```
		
		---
		
		Client capabilities for a {@link WorkspaceSymbolRequest}.
		
		---
		
		
		Capabilities specific to the `workspace/symbol` request.
	**/
	extern var symbol : Null<externs.type.Lsp_WorkspaceSymbolClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.textDocumentContent: (lsp.TextDocumentContentClientCapabilities)?
		```
		
		---
		
		Client capabilities for a text document content provider.
		
		
		---
		
		
		Capabilities specific to the `workspace/textDocumentContent` request.
		
	**/
	extern var textDocumentContent : Null<externs.type.Lsp_TextDocumentContentClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.workspaceEdit: (lsp.WorkspaceEditClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to `WorkspaceEdit`s.
	**/
	extern var workspaceEdit : Null<externs.type.Lsp_WorkspaceEditClientCapabilities>;
	/**
		```lua
		(field) lsp.WorkspaceClientCapabilities.workspaceFolders: boolean?
		```
		
		---
		
		
		The client has support for workspace folders.
		
	**/
	extern var workspaceFolders : Null<Bool>;
}