package externs.type;

/**
	```lua
	(class) vim.lsp.completion.BufferOpts
	```
	
	---
	
	 @inlinedoc
**/
extern class Vim_Lsp_Completion_BufferOpts {
	/**
		```lua
		(field) vim.lsp.completion.BufferOpts.autotrigger: boolean?
		```
		
		---
		
		(default: false) When true, completion triggers automatically based on the server's `triggerCharacters`.
	**/
	extern var autotrigger : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.completion.BufferOpts.convert: (fun(item: lsp.CompletionItem):table)?
		```
		
		---
		
		Transforms an LSP CompletionItem to |complete-items|.
		
		---
		
		```lua
		function (item: lsp.CompletionItem)
		  -> table
		```
	**/
	extern var convert : Null<(item:externs.type.Lsp_CompletionItem) -> lua.Table.AnyTable>;
}