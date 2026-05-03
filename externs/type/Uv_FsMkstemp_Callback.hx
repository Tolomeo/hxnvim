package externs.type;

@:native("uv.fs_mkstemp.callback") extern typedef Uv_FsMkstemp_Callback = (err:externs.type.Uv_Callback_Err, fd:Int, path:String) -> Dynamic;