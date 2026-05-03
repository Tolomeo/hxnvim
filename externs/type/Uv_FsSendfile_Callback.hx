package externs.type;

@:native("uv.fs_sendfile.callback") extern typedef Uv_FsSendfile_Callback = (err:externs.type.Uv_Callback_Err, bytes:Int) -> Dynamic;