package externs.type;

/**
	```lua
	(class) vim.VersionRange
	```
**/
@:structInit extern class Vim_VersionRange {
	/**
		```lua
		(field) vim.VersionRange.from: vim.Version
		```
	**/
	extern var from : externs.type.Vim_Version;
	/**
		```lua
		(field) vim.VersionRange.to: (vim.Version)?
		```
	**/
	extern var to : Null<externs.type.Vim_Version>;
	/**
		```lua
		(method) vim.VersionRange:has(version: string|vim.Version)
		  -> boolean
		```
	**/
	extern function has(version:haxe.extern.EitherType<String, externs.type.Vim_Version>):Dynamic;
}