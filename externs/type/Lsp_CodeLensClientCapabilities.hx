package externs.type;

/**
	```lua
	(class) lsp.CodeLensClientCapabilities
	```
	
	---
	
	The client capabilities  of a {@link CodeLensRequest}.
**/
@:native("lsp.CodeLensClientCapabilities") extern class Lsp_CodeLensClientCapabilities {
	/**
		```lua
		(field) lsp.CodeLensClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether code lens supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.CodeLensClientCapabilities.resolveSupport: (lsp.ClientCodeLensResolveOptions)?
		```
		
		---
		
		
		Whether the client supports resolving additional code lens
		properties via a separate `codeLens/resolve` request.
		
	**/
	extern var resolveSupport : Null<externs.type.Lsp_ClientCodeLensResolveOptions>;
}