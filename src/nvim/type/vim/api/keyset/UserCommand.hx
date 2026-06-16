package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.user_command
	```
**/
@:structInit class UserCommand {
	/**
		```lua
		(field) vim.api.keyset.user_command.addr: any
		```
	**/
	@:optional
	var addr : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.bang: boolean?
		```
	**/
	@:optional
	var bang : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.bar: boolean?
		```
	**/
	@:optional
	var bar : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.complete: any
		```
	**/
	@:optional
	var complete : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.count: any
		```
	**/
	@:optional
	var count : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.desc: any
		```
	**/
	@:optional
	var desc : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.force: boolean?
		```
	**/
	@:optional
	var force : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.keepscript: boolean?
		```
	**/
	@:optional
	var keepscript : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.user_command.nargs: any
		```
	**/
	@:optional
	var nargs : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.preview: any
		```
	**/
	@:optional
	var preview : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.range: any
		```
	**/
	@:optional
	var range : Null<Any>;
	/**
		```lua
		(field) vim.api.keyset.user_command.register: boolean?
		```
	**/
	@:optional
	var register : Null<Bool>;
}