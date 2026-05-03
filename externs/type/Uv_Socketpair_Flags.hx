package externs.type;

/**
	```lua
	(class) uv.socketpair.flags
	```
	
	---
	
	 uv.socketpair.flags
	
**/
@:native("uv.socketpair.flags") extern class Uv_Socketpair_Flags {
	/**
		```lua
		(field) uv.socketpair.flags.nonblock: true|false
		```
		
		---
		
		
		 Opens the specified socket handle for `OVERLAPPED` or `FIONBIO`/`O_NONBLOCK` I/O usage. This is recommended for handles that will be used by libuv, and not usually recommended otherwise.
	**/
	extern var nonblock : Bool;
}