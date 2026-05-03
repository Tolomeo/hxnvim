package externs.type;

/**
	```lua
	(class) lsp.ServerInfo
	```
	
	---
	
	Information about the server
	
**/
@:native("lsp.ServerInfo") extern class Lsp_ServerInfo {
	/**
		```lua
		(field) lsp.ServerInfo.name: string
		```
		
		---
		
		
		The name of the server as defined by the server.
	**/
	extern var name : String;
	/**
		```lua
		(field) lsp.ServerInfo.version: string?
		```
		
		---
		
		
		The server's version as defined by the server.
	**/
	extern var version : Null<String>;
}