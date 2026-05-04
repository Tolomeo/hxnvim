package externs.type;

/**
	```lua
	(class) uv.udp_recv_start.callback.flags
	```
**/
@:structInit extern class Uv_UdpRecvStart_Callback_Flags {
	/**
		```lua
		(field) uv.udp_recv_start.callback.flags.mmsg_chunk: boolean|nil
		```
	**/
	extern var mmsg_chunk : haxe.extern.EitherType<Bool, Void>;
	/**
		```lua
		(field) uv.udp_recv_start.callback.flags.partial: boolean|nil
		```
	**/
	extern var partial : haxe.extern.EitherType<Bool, Void>;
}