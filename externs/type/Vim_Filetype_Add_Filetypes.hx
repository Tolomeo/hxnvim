package externs.type;

/**
	```lua
	(class) vim.filetype.add.filetypes
	```
**/
extern class Vim_Filetype_Add_Filetypes {
	/**
		```lua
		(field) vim.filetype.add.filetypes.extension: table<string, string|[string|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?, { priority: number }]|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?>?
		```
	**/
	extern var extension : Null<externs.type.Vim_Filetype_Mapping>;
	/**
		```lua
		(field) vim.filetype.add.filetypes.filename: table<string, string|[string|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?, { priority: number }]|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?>?
		```
	**/
	extern var filename : Null<externs.type.Vim_Filetype_Mapping>;
	/**
		```lua
		(field) vim.filetype.add.filetypes.pattern: table<string, string|[string|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?, { priority: number }]|fun(path: string, bufnr: integer, ...any):string?, fun(b: integer)?>?
		```
		
		---
		
		 @inlinedoc
	**/
	extern var pattern : Null<externs.type.Vim_Filetype_Mapping>;
}