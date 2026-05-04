package externs.type;

/**
	```lua
	(class) uv.fs_event_start.callback.events
	```
**/
@:structInit extern class Uv_FsEventStart_Callback_Events {
	/**
		```lua
		(field) uv.fs_event_start.callback.events.change: boolean|nil
		```
	**/
	extern var change : haxe.extern.EitherType<Bool, Void>;
	/**
		```lua
		(field) uv.fs_event_start.callback.events.rename: boolean|nil
		```
	**/
	extern var rename : haxe.extern.EitherType<Bool, Void>;
}