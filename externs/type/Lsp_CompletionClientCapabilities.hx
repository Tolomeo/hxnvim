package externs.type;

/**
	```lua
	(class) lsp.CompletionClientCapabilities
	```
	
	---
	
	Completion client capabilities
**/
extern class Lsp_CompletionClientCapabilities {
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.completionItem: (lsp.ClientCompletionItemOptions)?
		```
		
		---
		
		
		The client supports the following `CompletionItem` specific
		capabilities.
	**/
	extern var completionItem : Null<externs.type.Lsp_ClientCompletionItemOptions>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.completionItemKind: (lsp.ClientCompletionItemOptionsKind)?
		```
	**/
	extern var completionItemKind : Null<externs.type.Lsp_ClientCompletionItemOptionsKind>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.completionList: (lsp.CompletionListCapabilities)?
		```
		
		---
		
		The client supports the following `CompletionList` specific
		capabilities.
		
		
		---
		
		
		The client supports the following `CompletionList` specific
		capabilities.
		
	**/
	extern var completionList : Null<externs.type.Lsp_CompletionListCapabilities>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.contextSupport: boolean?
		```
		
		---
		
		
		The client supports to send additional context information for a
		`textDocument/completion` request.
	**/
	extern var contextSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether completion supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.CompletionClientCapabilities.insertTextMode: (1|2)?
		```
		
		---
		
		How whitespace and indentation is handled during completion
		item insertion.
		
		
		---
		
		
		Defines how the client handles whitespace and indentation
		when accepting a completion item that uses multi line
		text in either `insertText` or `textEdit`.
		
		
		---
		
		```lua
		-- How whitespace and indentation is handled during completion
		-- item insertion.
		-- 
		lsp.InsertTextMode:
		    | 1 -- asIs
		    | 2 -- adjustIndentation
		```
	**/
	extern var insertTextMode : Null<externs.type.Lsp_InsertTextMode>;
}