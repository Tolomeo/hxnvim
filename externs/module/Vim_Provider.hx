package externs.module;

@:native("vim.provider") extern class Vim_Provider {
	/**
		```lua
		(global) vim.provider.perl: table
		```
	**/
	extern var perl : externs.module.Vim_Provider_Perl;
	/**
		```lua
		(global) vim.provider.python: table
		```
	**/
	extern var python : externs.module.Vim_Provider_Python;
	/**
		```lua
		(global) vim.provider.ruby: table
		```
	**/
	extern var ruby : externs.module.Vim_Provider_Ruby;
}