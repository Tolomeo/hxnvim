package externs.type;

/**
	```lua
	(class) lsp.DidChangeWatchedFilesClientCapabilities
	```
**/
@:structInit extern class Lsp_DidChangeWatchedFilesClientCapabilities {
	/**
		```lua
		(field) lsp.DidChangeWatchedFilesClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Did change watched files notification supports dynamic registration. Please note
		that the current protocol doesn't support static configuration for file changes
		from the server side.
	**/
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DidChangeWatchedFilesClientCapabilities.relativePatternSupport: boolean?
		```
		
		---
		
		
		Whether the client has support for {@link  RelativePattern relative pattern}
		or not.
		
	**/
	extern var relativePatternSupport : Null<Bool>;
}