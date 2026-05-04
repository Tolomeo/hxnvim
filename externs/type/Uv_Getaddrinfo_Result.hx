package externs.type;

/**
	```lua
	(class) uv.getaddrinfo.result
	```
**/
@:structInit extern class Uv_Getaddrinfo_Result {
	/**
		```lua
		(field) uv.getaddrinfo.result.addr: string
		```
	**/
	extern var addr : String;
	/**
		```lua
		(field) uv.getaddrinfo.result.canonname: string|nil
		```
	**/
	extern var canonname : haxe.extern.EitherType<String, Void>;
	/**
		```lua
		(field) uv.getaddrinfo.result.family: string|"appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"
		```
		
		---
		
		```lua
		uv.socket.family:
		    | "unix"
		    | "inet"
		    | "inet6"
		    | "ipx"
		    | "netlink"
		    | "x25"
		    | "ax25"
		    | "atmpvc"
		    | "appletalk"
		    | "packet"
		```
	**/
	extern var family : haxe.extern.EitherType<externs.type.Uv_Socket_Family, String>;
	/**
		```lua
		(field) uv.getaddrinfo.result.port: integer|nil
		```
	**/
	extern var port : haxe.extern.EitherType<Int, Void>;
	/**
		```lua
		(field) uv.getaddrinfo.result.protocol: string
		```
	**/
	extern var protocol : String;
	/**
		```lua
		(field) uv.getaddrinfo.result.socktype: string
		```
	**/
	extern var socktype : String;
}