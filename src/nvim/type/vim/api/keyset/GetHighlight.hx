package nvim.type.vim.api.keyset;

/**
	```lua
	(class) vim.api.keyset.get_highlight
	```
**/
@:structInit class GetHighlight {
	/**
		```lua
		(field) vim.api.keyset.get_highlight.create: boolean?
		```
	**/
	@:optional
	var create : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.id: integer?
		```
	**/
	@:optional
	var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.link: boolean?
		```
	**/
	@:optional
	var link : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.name: string?
		```
	**/
	@:optional
	var name : Null<String>;
}