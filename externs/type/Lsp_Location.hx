package externs.type;

/**
	```lua
	(class) lsp.Location
	```
	
	---
	
	Represents a location inside a resource, such as a line
	inside a text file.
**/
extern class Lsp_Location {
	/**
		```lua
		(field) lsp.Location.range: lsp.Range
		```
		
		---
		
		A range in a text document expressed as (zero-based) start and end positions.
		
		If you want to specify a range that contains a line including the line ending
		character(s) then use an end position denoting the start of the next line.
		For example:
		```ts
		{
		    start: { line: 5, character: 23 }
		    end : { line 6, character : 0 }
		}
		```
	**/
	extern var range : externs.type.Lsp_Range;
	/**
		```lua
		(field) lsp.Location.uri: string
		```
	**/
	extern var uri : externs.type.Lsp_DocumentUri;
}