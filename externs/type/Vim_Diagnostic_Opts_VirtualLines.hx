package externs.type;

/**
	```lua
	(class) vim.diagnostic.Opts.VirtualLines
	```
**/
@:structInit extern class Vim_Diagnostic_Opts_VirtualLines {
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualLines.current_line: boolean?
		```
		
		---
		
		
		 Only show diagnostics for the current line.
		 (default: `false`)
	**/
	extern var current_line : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualLines.format: fun(diagnostic: vim.Diagnostic):string??
		```
		
		---
		
		
		 A function that takes a diagnostic as input and returns a string or nil.
		 If the return value is nil, the diagnostic is not displayed by the handler.
		 Else the output text is used to display the diagnostic.
		
		---
		
		```lua
		function (diagnostic: vim.Diagnostic)
		  -> string?
		```
	**/
	extern var format : Null<(diagnostic:externs.type.Vim_Diagnostic) -> Null<String>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualLines.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 Only show virtual lines for diagnostics matching the given
		 severity |diagnostic-severity|
		
		---
		
		 @nodoc
	**/
	extern var severity : Null<externs.type.Vim_Diagnostic_SeverityFilter>;
}