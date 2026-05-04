package externs.type;

/**
	```lua
	(class) uv.udp_recv_start.callback.addr
	```
**/
extern class Uv_UdpRecvStart_Callback_Addr {
	/**
		```lua
		(field) uv.udp_recv_start.callback.addr.family: string|"appletalk"|"atmpvc"|"ax25"|"inet"|"inet6"|"ipx"|"netlink"|"packet"|"unix"|"x25"
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
		(field) uv.udp_recv_start.callback.addr.ip: string
		```
	**/
	extern var ip : String;
	/**
		```lua
		(field) uv.udp_recv_start.callback.addr.port: integer
		```
	**/
	extern var port : Int;
}