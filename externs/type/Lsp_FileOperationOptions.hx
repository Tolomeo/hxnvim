package externs.type;

/**
	```lua
	(class) lsp.FileOperationOptions
	```
	
	---
	
	Options for notifications/requests for user operations on files.
	
**/
extern class Lsp_FileOperationOptions {
	/**
		```lua
		(field) lsp.FileOperationOptions.didCreate: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving didCreateFiles notifications.
	**/
	extern var didCreate : Null<externs.type.Lsp_FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.didDelete: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving didDeleteFiles file notifications.
	**/
	extern var didDelete : Null<externs.type.Lsp_FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.didRename: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving didRenameFiles notifications.
	**/
	extern var didRename : Null<externs.type.Lsp_FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.willCreate: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving willCreateFiles requests.
	**/
	extern var willCreate : Null<externs.type.Lsp_FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.willDelete: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving willDeleteFiles file requests.
	**/
	extern var willDelete : Null<externs.type.Lsp_FileOperationRegistrationOptions>;
	/**
		```lua
		(field) lsp.FileOperationOptions.willRename: (lsp.FileOperationRegistrationOptions)?
		```
		
		---
		
		The options to register for file operations.
		
		
		---
		
		
		The server is interested in receiving willRenameFiles requests.
	**/
	extern var willRename : Null<externs.type.Lsp_FileOperationRegistrationOptions>;
}