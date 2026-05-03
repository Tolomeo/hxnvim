package externs.type;

/**
	```lua
	(class) vim.lsp.rpc.ExtraSpawnParams
	```
	
	---
	
	 Additional context for the LSP server process.
**/
@:native("vim.lsp.rpc.ExtraSpawnParams") extern class Vim_Lsp_Rpc_ExtraSpawnParams {
	/**
		```lua
		(field) vim.lsp.rpc.ExtraSpawnParams.cwd: string?
		```
		
		---
		
		Working directory for the LSP server process
	**/
	extern var cwd : Null<String>;
	/**
		```lua
		(field) vim.lsp.rpc.ExtraSpawnParams.detached: boolean?
		```
		
		---
		
		Detach the LSP server process from the current process
	**/
	extern var detached : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.rpc.ExtraSpawnParams.env: table<string, string>?
		```
		
		---
		
		Additional environment variables for LSP server process. See |vim.system()|
	**/
	extern var env : Null<lua.Table<String, String>>;
}