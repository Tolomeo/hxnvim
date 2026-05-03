package externs.type;

/**
	```lua
	(class) lsp.RegularExpressionsClientCapabilities
	```
	
	---
	
	Client capabilities specific to regular expressions.
	
**/
@:native("lsp.RegularExpressionsClientCapabilities") extern class Lsp_RegularExpressionsClientCapabilities {
	/**
		```lua
		(field) lsp.RegularExpressionsClientCapabilities.engine: string
		```
		
		---
		
		
		The engine's name.
	**/
	extern var engine : externs.type.Lsp_RegularExpressionEngineKind;
	/**
		```lua
		(field) lsp.RegularExpressionsClientCapabilities.version: string?
		```
		
		---
		
		
		The engine's version.
	**/
	extern var version : Null<String>;
}