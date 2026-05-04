package externs.type;

/**
	```lua
	(class) uv.fs_readdir.entry
	```
**/
extern class Uv_FsReaddir_Entry {
	/**
		```lua
		(field) uv.fs_readdir.entry.name: string
		```
	**/
	extern var name : String;
	/**
		```lua
		(field) uv.fs_readdir.entry.type: string
		```
	**/
	extern var type : String;
}