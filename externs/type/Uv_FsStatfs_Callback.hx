package externs.type;

@:native("uv.fs_statfs.callback") extern typedef Uv_FsStatfs_Callback = (err:externs.type.Uv_Callback_Err, stat:haxe.extern.EitherType<externs.type.Uv_FsStatfs_Result, Void>) -> Dynamic;