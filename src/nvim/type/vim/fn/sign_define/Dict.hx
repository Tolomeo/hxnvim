package nvim.type.vim.fn.sign_define;

/**
	```lua
	(class) vim.fn.sign_define.dict
	```
**/
@:structInit class Dict {
	/**
		```lua
		(field) vim.fn.sign_define.dict.culhl: string?
		```
	**/
	@:optional
	var culhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.icon: string?
		```
	**/
	@:optional
	var icon : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.linehl: string?
		```
	**/
	@:optional
	var linehl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.numhl: string?
		```
	**/
	@:optional
	var numhl : Null<String>;
	/**
		```lua
		(field) vim.fn.sign_define.dict.text: string
		```
	**/
	var text : String;
	/**
		```lua
		(field) vim.fn.sign_define.dict.texthl: string?
		```
	**/
	@:optional
	var texthl : Null<String>;
}