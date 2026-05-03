package externs.type;

/**
	```lua
	(class) lsp.MarkedStringWithLanguage
	```
**/
@:native("lsp.MarkedStringWithLanguage") extern class Lsp_MarkedStringWithLanguage {
	/**
		```lua
		(field) lsp.MarkedStringWithLanguage.language: string
		```
	**/
	extern var language : String;
	/**
		```lua
		(field) lsp.MarkedStringWithLanguage.value: string
		```
	**/
	extern var value : String;
}