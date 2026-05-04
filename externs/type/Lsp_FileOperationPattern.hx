package externs.type;

/**
	```lua
	(class) lsp.FileOperationPattern
	```
	
	---
	
	A pattern to describe in which file operation requests or notifications
	the server is interested in receiving.
	
**/
@:structInit extern class Lsp_FileOperationPattern {
	/**
		```lua
		(field) lsp.FileOperationPattern.glob: string
		```
		
		---
		
		
		The glob pattern to match. Glob patterns can have the following syntax:
		- `*` to match one or more characters in a path segment
		- `?` to match on one character in a path segment
		- `**` to match any number of path segments, including none
		- `{}` to group sub patterns into an OR expression. (e.g. `**\/*.{ts,js}` matches all TypeScript and JavaScript files)
		- `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
		- `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
	**/
	extern var glob : String;
	/**
		```lua
		(field) lsp.FileOperationPattern.matches: ("file"|"folder")?
		```
		
		---
		
		A pattern kind describing if a glob pattern matches a file a folder or
		both.
		
		
		---
		
		
		Whether to match files or folders with this pattern.
		
		Matches both if undefined.
		
		---
		
		```lua
		-- A pattern kind describing if a glob pattern matches a file a folder or
		-- both.
		-- 
		lsp.FileOperationPatternKind:
		    | "file" -- file
		    | "folder" -- folder
		```
	**/
	extern var matches : Null<externs.type.Lsp_FileOperationPatternKind>;
	/**
		```lua
		(field) lsp.FileOperationPattern.options: (lsp.FileOperationPatternOptions)?
		```
		
		---
		
		Matching options for the file operation pattern.
		
		
		---
		
		
		Additional options used during matching.
	**/
	extern var options : Null<externs.type.Lsp_FileOperationPatternOptions>;
}