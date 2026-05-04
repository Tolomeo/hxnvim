package externs.type;

/**
	```lua
	(class) lsp.ClientInfo
	```
	
	---
	
	Information about the client
	
**/
extern class Lsp_ClientInfo {
	/**
		```lua
		(field) lsp.ClientInfo.name: string
		```
		
		---
		
		
		The name of the client as defined by the client.
	**/
	extern var name : String;
	/**
		```lua
		(field) lsp.ClientInfo.version: string?
		```
		
		---
		
		
		The client's version as defined by the client.
	**/
	extern var version : Null<String>;
}