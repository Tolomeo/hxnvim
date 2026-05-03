package externs.type;

/**
	```lua
	(class) uv.fs_symlink.flags
	```
**/
@:native("uv.fs_symlink.flags") extern class Uv_FsSymlink_Flags {
	/**
		```lua
		(field) uv.fs_symlink.flags.dir: boolean
		```
	**/
	extern var dir : Bool;
	/**
		```lua
		(field) uv.fs_symlink.flags.junction: boolean
		```
	**/
	extern var junction : Bool;
}