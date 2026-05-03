package externs.type;

@:native("uv.fs_mkdtemp.callback") extern typedef Uv_FsMkdtemp_Callback = (err:externs.type.Uv_Callback_Err, path:String) -> Dynamic;