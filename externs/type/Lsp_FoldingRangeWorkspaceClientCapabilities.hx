package externs.type;

/**
	```lua
	(class) lsp.FoldingRangeWorkspaceClientCapabilities
	```
	
	---
	
	Client workspace capabilities specific to folding ranges
	
**/
extern class Lsp_FoldingRangeWorkspaceClientCapabilities {
	/**
		```lua
		(field) lsp.FoldingRangeWorkspaceClientCapabilities.refreshSupport: boolean?
		```
		
		---
		
		
		Whether the client implementation supports a refresh request sent from the
		server to the client.
		
		Note that this event is global and will force the client to refresh all
		folding ranges currently shown. It should be used with absolute care and is
		useful for situation where a server for example detects a project wide
		change that requires such a calculation.
		
	**/
	extern var refreshSupport : Null<Bool>;
}