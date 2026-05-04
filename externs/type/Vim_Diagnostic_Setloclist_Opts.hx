package externs.type;

/**
	```lua
	(class) vim.diagnostic.setloclist.Opts
	```
	
	---
	
	Configuration table with the following keys:
**/
extern class Vim_Diagnostic_Setloclist_Opts {
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.namespace: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Only add diagnostics from the given namespace.
	**/
	extern var namespace : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.open: boolean?
		```
		
		---
		
		
		 Open the location list after setting.
		 (default: `true`)
	**/
	extern var open : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 See |diagnostic-severity|.
		
		---
		
		 @nodoc
	**/
	extern var severity : Null<externs.type.Vim_Diagnostic_SeverityFilter>;
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.title: string?
		```
		
		---
		
		
		 Title of the location list. Defaults to "Diagnostics".
	**/
	extern var title : Null<String>;
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.winnr: integer?
		```
		
		---
		
		
		 Window number to set location list for.
		 (default: `0`)
	**/
	extern var winnr : Null<Int>;
}