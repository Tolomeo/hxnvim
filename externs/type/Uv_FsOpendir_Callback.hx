package externs.type;

@:native("uv.fs_opendir.callback") extern typedef Uv_FsOpendir_Callback = (err:externs.type.Uv_Callback_Err, dir:externs.type.Uv_LuvDirT) -> Dynamic;