package externs.type;

/**
	```lua
	(class) uv.pipe.read_flags
	```
	
	---
	
	 uv.pipe.read_flags
	
**/
@:native("uv.pipe.read_flags") extern class Uv_Pipe_ReadFlags {
	/**
		```lua
		(field) uv.pipe.read_flags.nonblock: boolean
		```
	**/
	extern var nonblock : Bool;
}