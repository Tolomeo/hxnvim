package externs.type;

/**
	```lua
	(class) vim.snippet.ActiveFilter
	```
**/
@:structInit extern class Vim_Snippet_ActiveFilter {
	/**
		```lua
		(field) vim.snippet.ActiveFilter.direction: -1|1
		```
		
		---
		
		Navigation direction. -1 for previous, 1 for next.
		
		---
		
		```lua
		vim.snippet.Direction:
		    | -1
		    | 1
		```
	**/
	extern var direction : externs.type.Vim_Snippet_Direction;
}