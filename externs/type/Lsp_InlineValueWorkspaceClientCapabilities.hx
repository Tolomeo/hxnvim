package externs.type;

/**
	```lua
	(class) lsp.InlineValueWorkspaceClientCapabilities
	```
	
	---
	
	Client workspace capabilities specific to inline values.
	
**/
@:native("lsp.InlineValueWorkspaceClientCapabilities") extern class Lsp_InlineValueWorkspaceClientCapabilities {
	/**
		```lua
		(field) lsp.InlineValueWorkspaceClientCapabilities.refreshSupport: boolean?
		```
		
		---
		
		
		Whether the client implementation supports a refresh request sent from the
		server to the client.
		
		Note that this event is global and will force the client to refresh all
		inline values currently shown. It should be used with absolute care and is
		useful for situation where a server for example detects a project wide
		change that requires such a calculation.
	**/
	extern var refreshSupport : Null<Bool>;
}