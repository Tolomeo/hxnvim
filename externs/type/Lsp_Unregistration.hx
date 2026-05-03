package externs.type;

/**
	```lua
	(class) lsp.Unregistration
	```
	
	---
	
	General parameters to unregister a request or notification.
**/
@:native("lsp.Unregistration") extern class Lsp_Unregistration {
	/**
		```lua
		(field) lsp.Unregistration.id: string
		```
		
		---
		
		
		The id used to unregister the request or notification. Usually an id
		provided during the register request.
	**/
	extern var id : String;
	/**
		```lua
		(field) lsp.Unregistration.method: string
		```
		
		---
		
		
		The method to unregister for.
	**/
	extern var method : String;
}