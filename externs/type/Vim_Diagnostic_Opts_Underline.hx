package externs.type;

/**
	```lua
	(class) vim.diagnostic.Opts.Underline
	```
**/
@:structInit extern class Vim_Diagnostic_Opts_Underline {
	/**
		```lua
		(field) vim.diagnostic.Opts.Underline.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 Only underline diagnostics matching the given
		 severity |diagnostic-severity|.
		
		---
		
		 @nodoc
	**/
	extern var severity : Null<externs.type.Vim_Diagnostic_SeverityFilter>;
}