package externs.type;

/**
	```lua
	(class) uv.os_uname.info
	```
**/
@:native("uv.os_uname.info") extern class Uv_OsUname_Info {
	/**
		```lua
		(field) uv.os_uname.info.machine: string
		```
	**/
	extern var machine : String;
	/**
		```lua
		(field) uv.os_uname.info.release: string
		```
	**/
	extern var release : String;
	/**
		```lua
		(field) uv.os_uname.info.sysname: string
		```
	**/
	extern var sysname : String;
	/**
		```lua
		(field) uv.os_uname.info.version: string
		```
	**/
	extern var version : String;
}