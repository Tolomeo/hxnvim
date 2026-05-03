package externs.type;

/**
	```lua
	(class) vim.loader.ModuleInfo
	```
**/
@:native("vim.loader.ModuleInfo") extern class Vim_Loader_ModuleInfo {
	/**
		```lua
		(field) vim.loader.ModuleInfo.modname: string
		```
		
		---
		
		
		 Name of the module
	**/
	extern var modname : String;
	/**
		```lua
		(field) vim.loader.ModuleInfo.modpath: string
		```
		
		---
		
		 @inlinedoc
		
		 Path of the module
	**/
	extern var modpath : String;
	/**
		```lua
		(field) vim.loader.ModuleInfo.stat: (uv.fs_stat.result)?
		```
		
		---
		
		
		 The fs_stat of the module path. Won't be returned for `modname="*"`
	**/
	extern var stat : Null<externs.type.Uv_FsStat_Result>;
}