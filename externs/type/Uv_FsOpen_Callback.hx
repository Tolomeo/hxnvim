package externs.type;

@:native("uv.fs_open.callback") extern typedef Uv_FsOpen_Callback = (err:externs.type.Uv_Callback_Err, fd:Int) -> Dynamic;