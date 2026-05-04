package externs.type;

/**
	```lua
	(class) uv.fs_copyfile.flags_t
	```
**/
@:structInit extern class Uv_FsCopyfile_FlagsT {
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.excl: boolean
		```
	**/
	extern var excl : Bool;
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.ficlone: boolean
		```
	**/
	extern var ficlone : Bool;
	/**
		```lua
		(field) uv.fs_copyfile.flags_t.ficlone_force: boolean
		```
	**/
	extern var ficlone_force : Bool;
}