package externs.type;

/**
	```lua
	(class) uv.fs_event_start.flags
	```
**/
extern class Uv_FsEventStart_Flags {
	/**
		```lua
		(field) uv.fs_event_start.flags.recursive: boolean|nil
		```
		
		---
		
		default: false
	**/
	extern var recursive : haxe.extern.EitherType<Bool, Void>;
	/**
		```lua
		(field) uv.fs_event_start.flags.stat: boolean|nil
		```
		
		---
		
		default: false
	**/
	extern var stat : haxe.extern.EitherType<Bool, Void>;
	/**
		```lua
		(field) uv.fs_event_start.flags.watch_entry: boolean|nil
		```
		
		---
		
		default: false
	**/
	extern var watch_entry : haxe.extern.EitherType<Bool, Void>;
}