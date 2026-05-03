package externs.type;

@:native("uv.spawn.on_exit") extern typedef Uv_Spawn_OnExit = (code:Int, signal:Int) -> Dynamic;