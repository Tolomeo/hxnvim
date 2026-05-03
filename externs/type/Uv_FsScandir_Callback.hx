package externs.type;

@:native("uv.fs_scandir.callback") extern typedef Uv_FsScandir_Callback = (err:externs.type.Uv_Callback_Err, success:externs.type.Uv_UvFsT) -> Dynamic;