package externs.type;

/**
	```lua
	(class) uv.cpu_info.cpu.times
	```
**/
@:native("uv.cpu_info.cpu.times") extern class Uv_CpuInfo_Cpu_Times {
	/**
		```lua
		(field) uv.cpu_info.cpu.times.idle: number
		```
	**/
	extern var idle : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.irq: number
		```
	**/
	extern var irq : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.nice: number
		```
	**/
	extern var nice : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.sys: number
		```
	**/
	extern var sys : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times.user: number
		```
	**/
	extern var user : Float;
}