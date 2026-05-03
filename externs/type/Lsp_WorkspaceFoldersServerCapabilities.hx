package externs.type;

/**
	```lua
	(class) lsp.WorkspaceFoldersServerCapabilities
	```
**/
@:native("lsp.WorkspaceFoldersServerCapabilities") extern class Lsp_WorkspaceFoldersServerCapabilities {
	/**
		```lua
		(field) lsp.WorkspaceFoldersServerCapabilities.changeNotifications: (boolean|string)?
		```
		
		---
		
		
		Whether the server wants to receive workspace folder
		change notifications.
		
		If a string is provided the string is treated as an ID
		under which the notification is registered on the client
		side. The ID can be used to unregister for these events
		using the `client/unregisterCapability` request.
	**/
	extern var changeNotifications : Null<haxe.extern.EitherType<String, Bool>>;
	/**
		```lua
		(field) lsp.WorkspaceFoldersServerCapabilities.supported: boolean?
		```
		
		---
		
		
		The server has support for workspace folders
	**/
	extern var supported : Null<Bool>;
}