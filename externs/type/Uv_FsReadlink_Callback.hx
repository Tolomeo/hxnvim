package externs.type;

@:native("uv.fs_readlink.callback") extern typedef Uv_FsReadlink_Callback = (err:externs.type.Uv_Callback_Err, path:String) -> Dynamic;