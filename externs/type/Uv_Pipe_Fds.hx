package externs.type;

/**
	```lua
	(class) uv.pipe.fds
	```
**/
@:structInit extern class Uv_Pipe_Fds {
	/**
		```lua
		(field) uv.pipe.fds.read: integer
		```
	**/
	extern var read : Int;
	/**
		```lua
		(field) uv.pipe.fds.write: integer
		```
	**/
	extern var write : Int;
}