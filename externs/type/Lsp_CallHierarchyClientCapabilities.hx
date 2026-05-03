package externs.type;

/**
	```lua
	(class) lsp.CallHierarchyClientCapabilities
	```
**/
@:native("lsp.CallHierarchyClientCapabilities") extern class Lsp_CallHierarchyClientCapabilities {
	/**
		```lua
		(field) lsp.CallHierarchyClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
		return value for the corresponding server capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
}