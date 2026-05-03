package externs.type;

/**
	```lua
	(class) uv.pipe.write_flags
	```
	
	---
	
	 uv.pipe.write_flags
	
**/
@:native("uv.pipe.write_flags") extern class Uv_Pipe_WriteFlags {
	/**
		```lua
		(field) uv.pipe.write_flags.nonblock: boolean
		```
	**/
	extern var nonblock : Bool;
}