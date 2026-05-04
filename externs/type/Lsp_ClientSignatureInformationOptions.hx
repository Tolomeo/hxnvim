package externs.type;

/**
	```lua
	(class) lsp.ClientSignatureInformationOptions
	```
**/
@:structInit extern class Lsp_ClientSignatureInformationOptions {
	/**
		```lua
		(field) lsp.ClientSignatureInformationOptions.activeParameterSupport: boolean?
		```
		
		---
		
		
		The client supports the `activeParameter` property on `SignatureInformation`
		literal.
		
	**/
	extern var activeParameterSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientSignatureInformationOptions.documentationFormat: "markdown"|"plaintext"[]?
		```
		
		---
		
		
		Client supports the following content formats for the documentation
		property. The order describes the preferred format of the client.
	**/
	extern var documentationFormat : Null<Array<externs.type.Lsp_MarkupKind>>;
	/**
		```lua
		(field) lsp.ClientSignatureInformationOptions.noActiveParameterSupport: boolean?
		```
		
		---
		
		
		The client supports the `activeParameter` property on
		`SignatureHelp`/`SignatureInformation` being set to `null` to
		indicate that no parameter should be active.
		
	**/
	extern var noActiveParameterSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.ClientSignatureInformationOptions.parameterInformation: (lsp.ClientSignatureParameterInformationOptions)?
		```
		
		---
		
		
		Client capabilities specific to parameter information.
	**/
	extern var parameterInformation : Null<externs.type.Lsp_ClientSignatureParameterInformationOptions>;
}