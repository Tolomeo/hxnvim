package externs.type;

@:private extern class SeveritySort {
	extern var reverse : Null<Bool>;
}

/**
	```lua
	(class) vim.diagnostic.OptsResolved
	```
**/
extern class Vim_Diagnostic_OptsResolved {
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.float: vim.diagnostic.Opts.Float
		```
	**/
	extern var float : externs.type.Vim_Diagnostic_Opts_Float;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.severity_sort: { reverse: boolean }
		```
	**/
	extern var severity_sort : SeveritySort;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.signs: vim.diagnostic.Opts.Signs
		```
	**/
	extern var signs : externs.type.Vim_Diagnostic_Opts_Signs;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.underline: vim.diagnostic.Opts.Underline
		```
	**/
	extern var underline : externs.type.Vim_Diagnostic_Opts_Underline;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.update_in_insert: boolean
		```
	**/
	extern var update_in_insert : Bool;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.virtual_lines: vim.diagnostic.Opts.VirtualLines
		```
	**/
	extern var virtual_lines : externs.type.Vim_Diagnostic_Opts_VirtualLines;
	/**
		```lua
		(field) vim.diagnostic.OptsResolved.virtual_text: vim.diagnostic.Opts.VirtualText
		```
	**/
	extern var virtual_text : externs.type.Vim_Diagnostic_Opts_VirtualText;
}