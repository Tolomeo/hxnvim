package externs.type;

/**
	```lua
	(class) lsp.ServerCompletionItemOptions
	```
**/
extern class Lsp_ServerCompletionItemOptions {
	/**
		```lua
		(field) lsp.ServerCompletionItemOptions.labelDetailsSupport: boolean?
		```
		
		---
		
		
		The server has support for completion item label
		details (see also `CompletionItemLabelDetails`) when
		receiving a completion item in a resolve call.
		
	**/
	extern var labelDetailsSupport : Null<Bool>;
}