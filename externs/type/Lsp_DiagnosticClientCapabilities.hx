package externs.type;

/**
	```lua
	(class) lsp.DiagnosticClientCapabilities
	```
	
	---
	
	Client capabilities specific to diagnostic pull requests.
	
**/
@:native("lsp.DiagnosticClientCapabilities") extern class Lsp_DiagnosticClientCapabilities {
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.codeDescriptionSupport: boolean?
		```
		
		---
		
		
		Client supports a codeDescription property
		
	**/
	extern var codeDescriptionSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.dataSupport: boolean?
		```
		
		---
		
		
		Whether code action supports the `data` property which is
		preserved between a `textDocument/publishDiagnostics` and
		`textDocument/codeAction` request.
		
	**/
	extern var dataSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
		return value for the corresponding server capability as well.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.relatedDocumentSupport: boolean?
		```
		
		---
		
		
		Whether the clients supports related documents for document diagnostic pulls.
	**/
	extern var relatedDocumentSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.relatedInformation: boolean?
		```
		
		---
		
		
		Whether the clients accepts diagnostics with related information.
	**/
	extern var relatedInformation : Null<Bool>;
	/**
		```lua
		(field) lsp.DiagnosticClientCapabilities.tagSupport: (lsp.ClientDiagnosticsTagOptions)?
		```
		
		---
		
		
		Client supports the tag property to provide meta data about a diagnostic.
		Clients supporting tags have to handle unknown tags gracefully.
		
	**/
	extern var tagSupport : Null<externs.type.Lsp_ClientDiagnosticsTagOptions>;
}