package externs.type;

/**
	```lua
	(class) vim.diagnostic.Handler
	```
**/
@:native("vim.diagnostic.Handler") extern class Vim_Diagnostic_Handler {
	/**
		```lua
		(field) vim.diagnostic.Handler.hide: fun(namespace: integer, bufnr: integer)?
		```
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		```
	**/
	extern var hide : Null<(namespace:Int, bufnr:Int) -> Dynamic>;
	/**
		```lua
		(field) vim.diagnostic.Handler.show: fun(namespace: integer, bufnr: integer, diagnostics: vim.Diagnostic[], opts?: vim.diagnostic.OptsResolved)?
		```
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer, diagnostics: vim.Diagnostic[], opts?: vim.diagnostic.OptsResolved)
		```
	**/
	extern var show : Null<(namespace:Int, bufnr:Int, diagnostics:Array<externs.type.Vim_Diagnostic>, opts:externs.type.Vim_Diagnostic_OptsResolved) -> Dynamic>;
}