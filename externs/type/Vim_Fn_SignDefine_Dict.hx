package externs.type;

/**
	```lua
	(class) vim.fn.sign_define.dict
	```
**/
@:structInit extern class Vim_Fn_SignDefine_Dict {
	/**
		```lua
		(field) vim.fn.sign_define.dict.culhl: string?
		```
	**/
	extern var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.icon: string?
		```
	**/
	extern var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.linehl: string?
		```
	**/
	extern var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.numhl: string?
		```
	**/
	extern var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.text: string
		```
	**/
	extern var text : String;
	/**
		```lua
		(field) vim.fn.sign_define.dict.texthl: string?
		```
	**/
	extern var texthl : Null<String>;
}