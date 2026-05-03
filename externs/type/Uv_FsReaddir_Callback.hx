package externs.type;

@:native("uv.fs_readdir.callback") extern typedef Uv_FsReaddir_Callback = (err:externs.type.Uv_Callback_Err, entries:haxe.extern.EitherType<Array<externs.type.Uv_FsReaddir_Entry>, Void>) -> Dynamic;