package externs.type;

/**
	```lua
	(class) vim.lsp.completion.get.Opts
	```
	
	---
	
	 @inlinedoc
**/
extern class Vim_Lsp_Completion_Get_Opts {
	/**
		```lua
		(field) vim.lsp.completion.get.Opts.ctx: (lsp.CompletionContext)?
		```
		
		---
		
		Contains additional information about the context in which a completion request is triggered.
		
		---
		
		Completion context. Defaults to a trigger kind of `invoked`.
	**/
	extern var ctx : Null<externs.type.Lsp_CompletionContext>;
}