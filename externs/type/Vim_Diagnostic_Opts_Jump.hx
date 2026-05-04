package externs.type;

/**
	```lua
	(class) vim.diagnostic.Opts.Jump
	```
**/
@:structInit extern class Vim_Diagnostic_Opts_Jump {
	/**
		```lua
		(field) vim.diagnostic.Opts.Jump.float: (boolean|vim.diagnostic.Opts.Float)?
		```
		
		---
		
		
		 Default value of the {float} parameter of |vim.diagnostic.jump()|.
		 (default: false)
	**/
	extern var float : Null<haxe.extern.EitherType<Bool, externs.type.Vim_Diagnostic_Opts_Float>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Jump.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 Default value of the {severity} parameter of |vim.diagnostic.jump()|.
		
		---
		
		 @nodoc
	**/
	extern var severity : Null<externs.type.Vim_Diagnostic_SeverityFilter>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Jump.wrap: boolean?
		```
		
		---
		
		
		 Default value of the {wrap} parameter of |vim.diagnostic.jump()|.
		 (default: true)
	**/
	extern var wrap : Null<Bool>;
}