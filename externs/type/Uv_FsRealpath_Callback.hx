package externs.type;

@:native("uv.fs_realpath.callback") extern typedef Uv_FsRealpath_Callback = (err:externs.type.Uv_Callback_Err, path:String) -> Dynamic;