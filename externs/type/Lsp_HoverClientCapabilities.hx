package externs.type;

/**
	```lua
	(class) lsp.HoverClientCapabilities
	```
**/
extern class Lsp_HoverClientCapabilities {
	/**
		```lua
		(field) lsp.HoverClientCapabilities.contentFormat: "markdown"|"plaintext"[]?
		```
		
		---
		
		
		Client supports the following content formats for the content
		property. The order describes the preferred format of the client.
	**/
	extern var contentFormat : Null<Array<externs.type.Lsp_MarkupKind>>;
	/**
		```lua
		(field) lsp.HoverClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether hover supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
}