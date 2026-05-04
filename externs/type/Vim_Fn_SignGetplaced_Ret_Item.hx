package externs.type;

/**
	```lua
	(class) vim.fn.sign_getplaced.ret.item
	```
**/
extern class Vim_Fn_SignGetplaced_Ret_Item {
	/**
		```lua
		(field) vim.fn.sign_getplaced.ret.item.bufnr: integer
		```
	**/
	extern var bufnr : Int;
	/**
		```lua
		(field) vim.fn.sign_getplaced.ret.item.signs: vim.fn.sign[]
		```
	**/
	extern var signs : Array<externs.type.Vim_Fn_Sign>;
}