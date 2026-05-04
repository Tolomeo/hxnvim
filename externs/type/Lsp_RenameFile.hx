package externs.type;

/**
	```lua
	(class) lsp.RenameFile
	```
	
	---
	
	Rename file operation
**/
@:structInit extern class Lsp_RenameFile {
	/**
		```lua
		(field) lsp.RenameFile.annotationId: string?
		```
		
		---
		
		An identifier to refer to a change annotation stored with a workspace edit.
		
		---
		
		
		An optional annotation identifier describing the operation.
		
	**/
	extern var annotationId : Null<externs.type.Lsp_ChangeAnnotationIdentifier>;
	/**
		```lua
		(field) lsp.RenameFile.kind: "rename"
		```
		
		---
		
		
		A rename
	**/
	extern var kind : String;
	/**
		```lua
		(field) lsp.RenameFile.newUri: string
		```
		
		---
		
		
		The new location.
	**/
	extern var newUri : externs.type.Lsp_DocumentUri;
	/**
		```lua
		(field) lsp.RenameFile.oldUri: string
		```
		
		---
		
		
		The old (existing) location.
	**/
	extern var oldUri : externs.type.Lsp_DocumentUri;
	/**
		```lua
		(field) lsp.RenameFile.options: (lsp.RenameFileOptions)?
		```
		
		---
		
		Rename file options
		
		---
		
		
		Rename options.
	**/
	extern var options : Null<externs.type.Lsp_RenameFileOptions>;
}