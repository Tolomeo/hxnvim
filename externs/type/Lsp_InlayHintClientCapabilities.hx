package externs.type;

/**
	```lua
	(class) lsp.InlayHintClientCapabilities
	```
	
	---
	
	Inlay hint client capabilities.
	
**/
extern class Lsp_InlayHintClientCapabilities {
	/**
		```lua
		(field) lsp.InlayHintClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether inlay hints support dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.InlayHintClientCapabilities.resolveSupport: (lsp.ClientInlayHintResolveOptions)?
		```
		
		---
		
		
		Indicates which properties a client can resolve lazily on an inlay
		hint.
	**/
	extern var resolveSupport : Null<externs.type.Lsp_ClientInlayHintResolveOptions>;
}