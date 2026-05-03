package externs.type;

@:private extern class Capabilities {

}

/**
	```lua
	(class) lsp.DynamicCapabilities
	```
**/
@:native("lsp.DynamicCapabilities") extern class Lsp_DynamicCapabilities {
	/**
		```lua
		(field) lsp.DynamicCapabilities.capabilities: table<string, lsp.Registration[]>
		```
	**/
	extern var capabilities : Capabilities;
	/**
		```lua
		(field) lsp.DynamicCapabilities.client_id: integer
		```
	**/
	extern var client_id : Float;
	/**
		```lua
		function get(_: any, method: any, opts: any)
		  -> lsp.Registration
		```
	**/
	extern function get(_:Dynamic, method:Dynamic, opts:Dynamic):Dynamic;
	/**
		```lua
		function register(_: any, registrations: any)
		```
	**/
	extern function register(_:Dynamic, registrations:Dynamic):Dynamic;
	/**
		```lua
		function supports(_: any, method: any, opts: any)
		  -> boolean
		```
	**/
	extern function supports(_:Dynamic, method:Dynamic, opts:Dynamic):Dynamic;
	/**
		```lua
		function supports_registration(_: any, method: any)
		  -> false
		```
	**/
	extern function supports_registration(_:Dynamic, method:Dynamic):Dynamic;
	/**
		```lua
		function unregister(_: any, unregistrations: any)
		```
	**/
	extern function unregister(_:Dynamic, unregistrations:Dynamic):Dynamic;
}