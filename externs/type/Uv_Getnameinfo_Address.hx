package externs.type;

/**
	```lua
	(class) uv.getnameinfo.address
	```
	
	---
	
	 uv.getnameinfo.address
	
**/
extern class Uv_Getnameinfo_Address {
	/**
		```lua
		(field) uv.getnameinfo.address.family: string|integer
		```
	**/
	extern var family : haxe.extern.EitherType<String, Int>;
	/**
		```lua
		(field) uv.getnameinfo.address.ip: string
		```
	**/
	extern var ip : String;
	/**
		```lua
		(field) uv.getnameinfo.address.port: integer
		```
	**/
	extern var port : Int;
}