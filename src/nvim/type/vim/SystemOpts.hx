package nvim.type.vim;

/**
	```lua
	(class) vim.SystemOpts
	```
**/
@:structInit class SystemOpts {
	/**
		```lua
		(field) vim.SystemOpts.clear_env: boolean?
		```
	**/
	@:optional
	var clear_env : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.cwd: string?
		```
	**/
	@:optional
	var cwd : Null<String>;
	/**
		```lua
		(field) vim.SystemOpts.detach: boolean?
		```
	**/
	@:optional
	var detach : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.env: table<string, string|number>?
		```
	**/
	@:optional
	var env : Null<lua.Table<String, haxe.extern.EitherType<String, Float>>>;
	/**
		```lua
		(field) vim.SystemOpts.stderr: (fun(err?: string, data?: string)|false)?
		```
		
		---
		
		```lua
		function (err: string?, data: string?)
		```
	**/
	@:optional
	var stderr : Null<haxe.extern.EitherType<(err:Null<String>, data:Null<String>) -> Dynamic, Bool>>;
	/**
		```lua
		(field) vim.SystemOpts.stdin: (string|string[]|true)?
		```
	**/
	@:optional
	var stdin : Null<haxe.extern.EitherType<String, haxe.extern.EitherType<Array<String>, Bool>>>;
	/**
		```lua
		(field) vim.SystemOpts.stdout: (fun(err?: string, data?: string)|false)?
		```
		
		---
		
		```lua
		function (err: string?, data: string?)
		```
	**/
	@:optional
	var stdout : Null<haxe.extern.EitherType<(err:Null<String>, data:Null<String>) -> Dynamic, Bool>>;
	/**
		```lua
		(field) vim.SystemOpts.text: boolean?
		```
	**/
	@:optional
	var text : Null<Bool>;
	/**
		```lua
		(field) vim.SystemOpts.timeout: integer?
		```
		
		---
		
		Timeout in ms
	**/
	@:optional
	var timeout : Null<Int>;
}