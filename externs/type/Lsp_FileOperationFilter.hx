package externs.type;

/**
	```lua
	(class) lsp.FileOperationFilter
	```
	
	---
	
	A filter to describe in which file operation requests or notifications
	the server is interested in receiving.
	
**/
extern class Lsp_FileOperationFilter {
	/**
		```lua
		(field) lsp.FileOperationFilter.pattern: lsp.FileOperationPattern
		```
		
		---
		
		A pattern to describe in which file operation requests or notifications
		the server is interested in receiving.
		
		
		---
		
		
		The actual file operation pattern.
	**/
	extern var pattern : externs.type.Lsp_FileOperationPattern;
	/**
		```lua
		(field) lsp.FileOperationFilter.scheme: string?
		```
		
		---
		
		
		A Uri scheme like `file` or `untitled`.
	**/
	extern var scheme : Null<String>;
}