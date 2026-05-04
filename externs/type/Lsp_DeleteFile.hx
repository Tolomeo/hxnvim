package externs.type;

/**
	```lua
	(class) lsp.DeleteFile
	```
	
	---
	
	Delete file operation
**/
extern class Lsp_DeleteFile {
	/**
		```lua
		(field) lsp.DeleteFile.annotationId: string?
		```
		
		---
		
		An identifier to refer to a change annotation stored with a workspace edit.
		
		---
		
		
		An optional annotation identifier describing the operation.
		
	**/
	extern var annotationId : Null<externs.type.Lsp_ChangeAnnotationIdentifier>;
	/**
		```lua
		(field) lsp.DeleteFile.kind: "delete"
		```
		
		---
		
		
		A delete
	**/
	extern var kind : String;
	/**
		```lua
		(field) lsp.DeleteFile.options: (lsp.DeleteFileOptions)?
		```
		
		---
		
		Delete file options
		
		---
		
		
		Delete options.
	**/
	extern var options : Null<externs.type.Lsp_DeleteFileOptions>;
	/**
		```lua
		(field) lsp.DeleteFile.uri: string
		```
		
		---
		
		
		The file to delete.
	**/
	extern var uri : externs.type.Lsp_DocumentUri;
}