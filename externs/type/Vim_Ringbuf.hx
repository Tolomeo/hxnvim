package externs.type;

/**
	```lua
	(class) vim.Ringbuf
	```
**/
extern class Vim_Ringbuf {
	/**
		```lua
		function vim.Ringbuf.clear(self: vim.Ringbuf)
		```
		
		---
		
		 Clear all items
	**/
	extern static function clear():Dynamic;
	/**
		```lua
		function vim.Ringbuf.peek(self: vim.Ringbuf)
		  -> <T>?
		```
		
		---
		
		 Returns the first unread item without removing it
	**/
	extern static function peek<T>():Null<externs.type.T>;
	/**
		```lua
		function vim.Ringbuf.pop(self: vim.Ringbuf)
		  -> <T>?
		```
		
		---
		
		 Removes and returns the first unread item
	**/
	extern static function pop<T>():Null<externs.type.T>;
	/**
		```lua
		function vim.Ringbuf.push(self: vim.Ringbuf, item: <T>)
		```
		
		---
		
		 Adds an item, overriding the oldest item if the buffer is full.
	**/
	extern static function push<T>(item:T):Dynamic;
}