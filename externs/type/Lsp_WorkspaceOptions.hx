package externs.type;

/**
	```lua
	(class) lsp.WorkspaceOptions
	```
	
	---
	
	Defines workspace specific capabilities of the server.
	
**/
extern class Lsp_WorkspaceOptions {
	/**
		```lua
		(field) lsp.WorkspaceOptions.fileOperations: (lsp.FileOperationOptions)?
		```
		
		---
		
		Options for notifications/requests for user operations on files.
		
		
		---
		
		
		The server is interested in notifications/requests for operations on files.
		
	**/
	extern var fileOperations : Null<externs.type.Lsp_FileOperationOptions>;
	/**
		```lua
		(field) lsp.WorkspaceOptions.textDocumentContent: (lsp.TextDocumentContentOptions|lsp.TextDocumentContentRegistrationOptions)?
		```
		
		---
		
		Text document content provider options.
		
		
		---
		
		
		The server supports the `workspace/textDocumentContent` request.
		
		
		---
		
		Text document content provider registration options.
		
	**/
	extern var textDocumentContent : Null<haxe.extern.EitherType<externs.type.Lsp_TextDocumentContentOptions, externs.type.Lsp_TextDocumentContentRegistrationOptions>>;
	/**
		```lua
		(field) lsp.WorkspaceOptions.workspaceFolders: (lsp.WorkspaceFoldersServerCapabilities)?
		```
		
		---
		
		
		The server supports workspace folder.
		
	**/
	extern var workspaceFolders : Null<externs.type.Lsp_WorkspaceFoldersServerCapabilities>;
}