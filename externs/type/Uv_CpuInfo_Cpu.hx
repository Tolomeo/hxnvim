package externs.type;

/**
	```lua
	(class) uv.cpu_info.cpu
	```
**/
@:structInit extern class Uv_CpuInfo_Cpu {
	/**
		```lua
		(field) uv.cpu_info.cpu.model: string
		```
	**/
	extern var model : String;
	/**
		```lua
		(field) uv.cpu_info.cpu.speed: number
		```
	**/
	extern var speed : Float;
	/**
		```lua
		(field) uv.cpu_info.cpu.times: uv.cpu_info.cpu.times
		```
	**/
	extern var times : externs.type.Uv_CpuInfo_Cpu_Times;
}