package externs.type;

/**
	```lua
	(class) lsp.CompletionContext
	```
	
	---
	
	Contains additional information about the context in which a completion request is triggered.
**/
@:structInit extern class Lsp_CompletionContext {
	/**
		```lua
		(field) lsp.CompletionContext.triggerCharacter: string?
		```
		
		---
		
		
		The trigger character (a single character) that has trigger code complete.
		Is undefined if `triggerKind !== CompletionTriggerKind.TriggerCharacter`
	**/
	extern var triggerCharacter : Null<String>;
	/**
		```lua
		(field) lsp.CompletionContext.triggerKind: 1|2|3
		```
		
		---
		
		How a completion was triggered
		
		---
		
		
		How the completion was triggered.
		
		---
		
		```lua
		-- How a completion was triggered
		lsp.CompletionTriggerKind:
		    | 1 -- Invoked
		    | 2 -- TriggerCharacter
		    | 3 -- TriggerForIncompleteCompletions
		```
	**/
	extern var triggerKind : externs.type.Lsp_CompletionTriggerKind;
}