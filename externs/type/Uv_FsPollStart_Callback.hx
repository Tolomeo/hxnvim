package externs.type;

extern typedef Uv_FsPollStart_Callback = (err:externs.type.Uv_Callback_Err, prev:haxe.extern.EitherType<externs.type.Uv_FsStat_Result, Void>, curr:haxe.extern.EitherType<externs.type.Uv_FsStat_Result, Void>) -> Dynamic;