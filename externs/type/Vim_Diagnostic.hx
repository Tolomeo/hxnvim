package externs.type;

/**
	```lua
	(class) vim.Diagnostic
	```
	
	---
	
	 [diagnostic-structure](file:///usr/local/share/nvim/runtime/lua/vim)
	
	 Diagnostics use the same indexing as the rest of the Nvim API (i.e. 0-based
	 rows and columns). |api-indexing|
**/
extern class Vim_Diagnostic {
	/**
		```lua
		(field) vim.Diagnostic._tags: { deprecated: boolean, unnecessary: boolean }?
		```
	**/
	extern var _tags : Null<{ var deprecated : Bool; var unnecessary : Bool; }>;
	/**
		```lua
		(field) vim.Diagnostic.bufnr: integer?
		```
		
		---
		
		
		 Buffer number
	**/
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.code: (string|integer)?
		```
		
		---
		
		
		 The diagnostic code
	**/
	extern var code : Null<haxe.extern.EitherType<String, Int>>;
	/**
		```lua
		(field) vim.Diagnostic.col: integer
		```
		
		---
		
		
		 The starting column of the diagnostic (0-indexed)
	**/
	extern var col : Int;
	/**
		```lua
		(field) vim.Diagnostic.end_col: integer?
		```
		
		---
		
		
		 The final column of the diagnostic (0-indexed)
	**/
	extern var end_col : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.end_lnum: integer?
		```
		
		---
		
		
		 The final line of the diagnostic (0-indexed)
	**/
	extern var end_lnum : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.lnum: integer
		```
		
		---
		
		
		 The starting line of the diagnostic (0-indexed)
	**/
	extern var lnum : Int;
	/**
		```lua
		(field) vim.Diagnostic.message: string
		```
		
		---
		
		
		 The diagnostic text
	**/
	extern var message : String;
	/**
		```lua
		(field) vim.Diagnostic.namespace: integer?
		```
	**/
	extern var namespace : Null<Int>;
	/**
		```lua
		(field) vim.Diagnostic.severity: (vim.diagnostic.Severity)?
		```
		
		---
		
		 @nodoc
		
		---
		
		
		 The severity of the diagnostic |vim.diagnostic.severity|
	**/
	extern var severity : Null<externs.type.Vim_Diagnostic_Severity>;
	/**
		```lua
		(field) vim.Diagnostic.source: string?
		```
		
		---
		
		
		 The source of the diagnostic
	**/
	extern var source : Null<String>;
	/**
		```lua
		(field) vim.Diagnostic.user_data: any
		```
		
		---
		
		arbitrary data plugins can add
	**/
	extern var user_data : Null<Any>;
}