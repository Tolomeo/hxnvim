package externs.type;

/**
	```lua
	(class) lsp.RenameClientCapabilities
	```
**/
extern class Lsp_RenameClientCapabilities {
	/**
		```lua
		(field) lsp.RenameClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether rename supports dynamic registration.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameClientCapabilities.honorsChangeAnnotations: boolean?
		```
		
		---
		
		
		Whether the client honors the change annotations in
		text edits and resource operations returned via the
		rename request's workspace edit by for example presenting
		the workspace edit in the user interface and asking
		for confirmation.
		
	**/
	extern var honorsChangeAnnotations : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameClientCapabilities.prepareSupport: boolean?
		```
		
		---
		
		
		Client supports testing for validity of rename operations
		before execution.
		
	**/
	extern var prepareSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.RenameClientCapabilities.prepareSupportDefaultBehavior: 1?
		```
		
		---
		
		
		Client supports the default behavior result.
		
		The value indicates the default behavior used by the
		client.
		
		
		---
		
		```lua
		lsp.PrepareSupportDefaultBehavior:
		    | 1 -- Identifier
		```
	**/
	extern var prepareSupportDefaultBehavior : Null<externs.type.Lsp_PrepareSupportDefaultBehavior>;
}