package externs.type;

/**
	```lua
	(class) vim.api.keyset.open_term
	```
**/
@:native("vim.api.keyset.open_term") extern class Vim_Api_Keyset_OpenTerm {
	/**
		```lua
		(field) vim.api.keyset.open_term.force_crlf: boolean?
		```
	**/
	extern var force_crlf : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.open_term.on_input: fun(_: "input", term: integer, bufnr: integer, data: any)?
		```
		
		---
		
		```lua
		function (_: "input", term: integer, bufnr: integer, data: any)
		```
	**/
	extern var on_input : Null<(_:String, term:Int, bufnr:Int, data:Any) -> Dynamic>;
}