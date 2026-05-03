package externs.type;

/**
	```lua
	(class) uv.socketinfo
	```
	
	---
	
	 socket info
	
**/
@:native("uv.socketinfo") extern class Uv_Socketinfo {
	/**
		```lua
		(field) uv.socketinfo.family: string|"appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"
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
	extern var family : haxe.extern.EitherType<String, externs.type.Uv_Socket_Family>;
	/**
		```lua
		(field) uv.socketinfo.ip: string
		```
	**/
	extern var ip : String;
	/**
		```lua
		(field) uv.socketinfo.port: integer
		```
	**/
	extern var port : Int;
}