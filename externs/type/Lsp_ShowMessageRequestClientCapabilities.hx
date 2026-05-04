package externs.type;

/**
	```lua
	(class) lsp.ShowMessageRequestClientCapabilities
	```
	
	---
	
	Show message request client capabilities
**/
@:structInit extern class Lsp_ShowMessageRequestClientCapabilities {
	/**
		```lua
		(field) lsp.ShowMessageRequestClientCapabilities.messageActionItem: (lsp.ClientShowMessageActionItemOptions)?
		```
		
		---
		
		
		Capabilities specific to the `MessageActionItem` type.
	**/
	extern var messageActionItem : Null<externs.type.Lsp_ClientShowMessageActionItemOptions>;
}