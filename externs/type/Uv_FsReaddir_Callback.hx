package externs.type;

extern typedef Uv_FsReaddir_Callback = (err:externs.type.Uv_Callback_Err, entries:haxe.extern.EitherType<Array<externs.type.Uv_FsReaddir_Entry>, Void>) -> Dynamic;