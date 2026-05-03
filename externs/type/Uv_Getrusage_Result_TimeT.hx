package externs.type;

/**
	```lua
	(class) uv.getrusage.result.time_t
	```
**/
@:native("uv.getrusage.result.time_t") extern class Uv_Getrusage_Result_TimeT {
	/**
		```lua
		(field) uv.getrusage.result.time_t.sec: integer
		```
	**/
	extern var sec : Int;
	/**
		```lua
		(field) uv.getrusage.result.time_t.usec: integer
		```
	**/
	extern var usec : Int;
}