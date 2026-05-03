package externs.type;

@:native("uv.fs_read.callback") extern typedef Uv_FsRead_Callback = (err:externs.type.Uv_Callback_Err, data:String) -> Dynamic;