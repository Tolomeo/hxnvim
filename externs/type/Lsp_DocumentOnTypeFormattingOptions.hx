package externs.type;

/**
	```lua
	(class) lsp.DocumentOnTypeFormattingOptions
	```
	
	---
	
	Provider options for a {@link DocumentOnTypeFormattingRequest}.
**/
@:structInit extern class Lsp_DocumentOnTypeFormattingOptions {
	/**
		```lua
		(field) lsp.DocumentOnTypeFormattingOptions.firstTriggerCharacter: string
		```
		
		---
		
		
		A character on which formatting should be triggered, like `{`.
	**/
	extern var firstTriggerCharacter : String;
	/**
		```lua
		(field) lsp.DocumentOnTypeFormattingOptions.moreTriggerCharacter: string[]?
		```
		
		---
		
		
		More trigger characters.
	**/
	extern var moreTriggerCharacter : Null<Array<String>>;
}