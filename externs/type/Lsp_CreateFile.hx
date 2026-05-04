package externs.type;

/**
	```lua
	(class) lsp.CreateFile
	```
	
	---
	
	Create file operation.
**/
extern class Lsp_CreateFile {
	/**
		```lua
		(field) lsp.CreateFile.annotationId: string?
		```
		
		---
		
		An identifier to refer to a change annotation stored with a workspace edit.
		
		---
		
		
		An optional annotation identifier describing the operation.
		
	**/
	extern var annotationId : Null<externs.type.Lsp_ChangeAnnotationIdentifier>;
	/**
		```lua
		(field) lsp.CreateFile.kind: "create"
		```
		
		---
		
		
		A create
	**/
	extern var kind : String;
	/**
		```lua
		(field) lsp.CreateFile.options: (lsp.CreateFileOptions)?
		```
		
		---
		
		Options to create a file.
		
		---
		
		
		Additional options
	**/
	extern var options : Null<externs.type.Lsp_CreateFileOptions>;
	/**
		```lua
		(field) lsp.CreateFile.uri: string
		```
		
		---
		
		
		The resource to create.
	**/
	extern var uri : externs.type.Lsp_DocumentUri;
}