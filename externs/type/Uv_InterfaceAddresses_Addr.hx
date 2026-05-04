package externs.type;

/**
	```lua
	(class) uv.interface_addresses.addr
	```
**/
@:structInit extern class Uv_InterfaceAddresses_Addr {
	/**
		```lua
		(field) uv.interface_addresses.addr.family: string
		```
	**/
	extern var family : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.internal: boolean
		```
	**/
	extern var internal : Bool;
	/**
		```lua
		(field) uv.interface_addresses.addr.ip: string
		```
	**/
	extern var ip : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.mac: string
		```
	**/
	extern var mac : String;
	/**
		```lua
		(field) uv.interface_addresses.addr.netmask: string
		```
	**/
	extern var netmask : String;
}