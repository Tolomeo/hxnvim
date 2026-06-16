package nvim.type;

/**
	```lua
	(alias) ParserThreadState Expand to { timeout: integer? }
	```
**/
@:structInit class ParserThreadState {
	@:optional
	var timeout : Null<Int>;
}