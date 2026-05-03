package externs.type;

@:native("uv.fs_write.callback") extern typedef Uv_FsWrite_Callback = (err:externs.type.Uv_Callback_Err, bytes:Int) -> Dynamic;