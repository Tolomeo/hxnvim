package externs.type;

/**
	```lua
	(class) lsp.InsertReplaceEdit
	```
	
	---
	
	A special text edit to provide an insert and a replace operation.
	
**/
@:native("lsp.InsertReplaceEdit") extern class Lsp_InsertReplaceEdit {
	/**
		```lua
		(field) lsp.InsertReplaceEdit.insert: lsp.Range
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
		
		---
		
		
		The range if the insert is requested
	**/
	extern var insert : externs.type.Lsp_Range;
	/**
		```lua
		(field) lsp.InsertReplaceEdit.newText: string
		```
		
		---
		
		
		The string to be inserted.
	**/
	extern var newText : String;
	/**
		```lua
		(field) lsp.InsertReplaceEdit.replace: lsp.Range
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
		
		---
		
		
		The range if the replace is requested.
	**/
	extern var replace : externs.type.Lsp_Range;
}