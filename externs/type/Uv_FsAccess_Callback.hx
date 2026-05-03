package externs.type;

@:native("uv.fs_access.callback") extern typedef Uv_FsAccess_Callback = (err:externs.type.Uv_Callback_Err, permission:Bool) -> Dynamic;