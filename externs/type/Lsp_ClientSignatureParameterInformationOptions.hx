package externs.type;

/**
	```lua
	(class) lsp.ClientSignatureParameterInformationOptions
	```
**/
@:structInit extern class Lsp_ClientSignatureParameterInformationOptions {
	/**
		```lua
		(field) lsp.ClientSignatureParameterInformationOptions.labelOffsetSupport: boolean?
		```
		
		---
		
		
		The client supports processing label offsets instead of a
		simple label string.
		
	**/
	extern var labelOffsetSupport : Null<Bool>;
}