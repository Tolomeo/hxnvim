package externs.type;

/**
	```lua
	(class) lsp.CompletionOptions
	```
	
	---
	
	Completion options.
**/
@:native("lsp.CompletionOptions") extern class Lsp_CompletionOptions {
	/**
		```lua
		(field) lsp.CompletionOptions.allCommitCharacters: string[]?
		```
		
		---
		
		
		The list of all possible characters that commit a completion. This field can be used
		if clients don't support individual commit characters per completion item. See
		`ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
		
		If a server provides both `allCommitCharacters` and commit characters on an individual
		completion item the ones on the completion item win.
		
	**/
	extern var allCommitCharacters : Null<Array<String>>;
	/**
		```lua
		(field) lsp.CompletionOptions.completionItem: (lsp.ServerCompletionItemOptions)?
		```
		
		---
		
		
		The server supports the following `CompletionItem` specific
		capabilities.
		
	**/
	extern var completionItem : Null<externs.type.Lsp_ServerCompletionItemOptions>;
	/**
		```lua
		(field) lsp.CompletionOptions.resolveProvider: boolean?
		```
		
		---
		
		
		The server provides support to resolve additional
		information for a completion item.
	**/
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.CompletionOptions.triggerCharacters: string[]?
		```
		
		---
		
		
		Most tools trigger completion request automatically without explicitly requesting
		it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
		starts to type an identifier. For example if the user types `c` in a JavaScript file
		code complete will automatically pop up present `console` besides others as a
		completion item. Characters that make up identifiers don't need to be listed here.
		
		If code complete should automatically be trigger on characters not being valid inside
		an identifier (for example `.` in JavaScript) list them in `triggerCharacters`.
	**/
	extern var triggerCharacters : Null<Array<String>>;
	/**
		```lua
		(field) lsp.CompletionOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}