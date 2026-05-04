package externs.type;

/**
	```lua
	(class) lsp.FormattingOptions
	```
	
	---
	
	Value-object describing what options formatting should use.
**/
extern class Lsp_FormattingOptions {
	/**
		```lua
		(field) lsp.FormattingOptions.insertFinalNewline: boolean?
		```
		
		---
		
		
		Insert a newline character at the end of the file if one does not exist.
		
	**/
	extern var insertFinalNewline : Null<Bool>;
	/**
		```lua
		(field) lsp.FormattingOptions.insertSpaces: boolean
		```
		
		---
		
		
		Prefer spaces over tabs.
	**/
	extern var insertSpaces : Bool;
	/**
		```lua
		(field) lsp.FormattingOptions.tabSize: integer
		```
		
		---
		
		
		Size of a tab in spaces.
	**/
	extern var tabSize : externs.type.Uinteger;
	/**
		```lua
		(field) lsp.FormattingOptions.trimFinalNewlines: boolean?
		```
		
		---
		
		
		Trim all newlines after the final newline at the end of the file.
		
	**/
	extern var trimFinalNewlines : Null<Bool>;
	/**
		```lua
		(field) lsp.FormattingOptions.trimTrailingWhitespace: boolean?
		```
		
		---
		
		
		Trim trailing whitespace on a line.
		
	**/
	extern var trimTrailingWhitespace : Null<Bool>;
}