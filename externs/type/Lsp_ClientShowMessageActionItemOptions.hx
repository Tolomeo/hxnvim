package externs.type;

/**
	```lua
	(class) lsp.ClientShowMessageActionItemOptions
	```
**/
extern class Lsp_ClientShowMessageActionItemOptions {
	/**
		```lua
		(field) lsp.ClientShowMessageActionItemOptions.additionalPropertiesSupport: boolean?
		```
		
		---
		
		
		Whether the client supports additional attributes which
		are preserved and send back to the server in the
		request's response.
	**/
	extern var additionalPropertiesSupport : Null<Bool>;
}