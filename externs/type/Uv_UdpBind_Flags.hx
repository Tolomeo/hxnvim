package externs.type;

/**
	```lua
	(class) uv.udp_bind.flags
	```
	
	---
	
	 uv.udp_bind.flags
	
	
**/
extern class Uv_UdpBind_Flags {
	/**
		```lua
		(field) uv.udp_bind.flags.ipv6only: boolean
		```
	**/
	extern var ipv6only : Bool;
	/**
		```lua
		(field) uv.udp_bind.flags.reuseaddr: boolean
		```
	**/
	extern var reuseaddr : Bool;
}