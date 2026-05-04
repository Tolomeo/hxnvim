package externs.type;

@:private extern class Symbols {

}

@:private extern class Supertypes {

}

/**
	```lua
	(class) TSLangInfo
	```
**/
extern class TSLangInfo {
	/**
		```lua
		(field) TSLangInfo._wasm: boolean
		```
	**/
	extern var _wasm : Bool;
	/**
		```lua
		(field) TSLangInfo.abi_version: integer
		```
	**/
	extern var abi_version : Int;
	/**
		```lua
		(field) TSLangInfo.fields: string[]
		```
	**/
	extern var fields : Array<String>;
	/**
		```lua
		(field) TSLangInfo.metadata: TSLangMetadata?
		```
		
		---
		
		
		
		---
		
		ABI 15 only
	**/
	extern var metadata : Null<externs.type.TSLangMetadata>;
	/**
		```lua
		(field) TSLangInfo.state_count: integer
		```
	**/
	extern var state_count : Int;
	/**
		```lua
		(field) TSLangInfo.supertypes: table<string, string[]>
		```
	**/
	extern var supertypes : Supertypes;
	/**
		```lua
		(field) TSLangInfo.symbols: table<string, boolean>
		```
	**/
	extern var symbols : Symbols;
}