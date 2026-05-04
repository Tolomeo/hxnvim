package externs.type;

/**
	```lua
	(class) vim.Version
	```
**/
@:structInit extern class Vim_Version {
	/**
		```lua
		(field) vim.Version.build: string?
		```
	**/
	extern var build : Null<String>;
	/**
		```lua
		(field) vim.Version.major: number
		```
	**/
	extern var major : Float;
	/**
		```lua
		(field) vim.Version.minor: number
		```
	**/
	extern var minor : Float;
	/**
		```lua
		(field) vim.Version.patch: number
		```
	**/
	extern var patch : Float;
	/**
		```lua
		(field) vim.Version.prerelease: string?
		```
	**/
	extern var prerelease : Null<String>;
	/**
		```lua
		(method) vim.Version:__tostring()
		  -> string
		```
	**/
	extern function __tostring():Dynamic;
}