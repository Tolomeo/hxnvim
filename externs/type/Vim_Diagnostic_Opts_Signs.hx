package externs.type;

/**
	```lua
	(class) vim.diagnostic.Opts.Signs
	```
**/
@:native("vim.diagnostic.Opts.Signs") extern class Vim_Diagnostic_Opts_Signs {
	/**
		```lua
		(field) vim.diagnostic.Opts.Signs.linehl: table<vim.diagnostic.Severity, string>?
		```
		
		---
		
		
		 A table mapping |diagnostic-severity| to the highlight group used for the
		 whole line the sign is placed in.
	**/
	extern var linehl : Null<lua.Table<externs.type.Vim_Diagnostic_Severity, String>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Signs.numhl: table<vim.diagnostic.Severity, string>?
		```
		
		---
		
		
		 A table mapping |diagnostic-severity| to the highlight group used for the
		 line number where the sign is placed.
	**/
	extern var numhl : Null<lua.Table<externs.type.Vim_Diagnostic_Severity, String>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Signs.priority: integer?
		```
		
		---
		
		
		 Base priority to use for signs. When {severity_sort} is used, the priority
		 of a sign is adjusted based on its severity.
		 Otherwise, all signs use the same priority.
		 (default: `10`)
	**/
	extern var priority : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Signs.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 Only show signs for diagnostics matching the given
		 severity |diagnostic-severity|
		
		---
		
		 @nodoc
	**/
	extern var severity : Null<externs.type.Vim_Diagnostic_SeverityFilter>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Signs.text: table<vim.diagnostic.Severity, string>?
		```
		
		---
		
		
		 A table mapping |diagnostic-severity| to the sign text to display in the
		 sign column. The default is to use `"E"`, `"W"`, `"I"`, and `"H"` for errors,
		 warnings, information, and hints, respectively. Example:
		 ```lua
		 vim.diagnostic.config({
		   signs = { text = { [vim.diagnostic.severity.ERROR] = 'E', ... } }
		 })
		 ```
	**/
	extern var text : Null<lua.Table<externs.type.Vim_Diagnostic_Severity, String>>;
}