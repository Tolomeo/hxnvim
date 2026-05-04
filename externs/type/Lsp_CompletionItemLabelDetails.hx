package externs.type;

/**
	```lua
	(class) lsp.CompletionItemLabelDetails
	```
	
	---
	
	Additional details for a completion item label.
	
**/
extern class Lsp_CompletionItemLabelDetails {
	/**
		```lua
		(field) lsp.CompletionItemLabelDetails.description: string?
		```
		
		---
		
		
		An optional string which is rendered less prominently after {@link CompletionItem.detail}. Should be used
		for fully qualified names and file paths.
	**/
	extern var description : Null<String>;
	/**
		```lua
		(field) lsp.CompletionItemLabelDetails.detail: string?
		```
		
		---
		
		
		An optional string which is rendered less prominently directly after {@link CompletionItem.label label},
		without any spacing. Should be used for function signatures and type annotations.
	**/
	extern var detail : Null<String>;
}