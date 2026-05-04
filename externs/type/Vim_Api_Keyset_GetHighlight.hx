package externs.type;

/**
	```lua
	(class) vim.api.keyset.get_highlight
	```
**/
@:structInit extern class Vim_Api_Keyset_GetHighlight {
	/**
		```lua
		(field) vim.api.keyset.get_highlight.create: boolean?
		```
	**/
	extern var create : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.id: integer?
		```
	**/
	extern var id : Null<Int>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.link: boolean?
		```
	**/
	extern var link : Null<Bool>;
	/**
		```lua
		(field) vim.api.keyset.get_highlight.name: string?
		```
	**/
	extern var name : Null<String>;
}