package externs.type;

@:native("uv.spawn.options.stdio") extern typedef Uv_Spawn_Options_Stdio = haxe.extern.EitherType<Int, haxe.extern.EitherType<externs.type.Uv_UvStreamT, Void>>;