package externs.type;

extern typedef Uv_FsFstat_Callback = (err:externs.type.Uv_Callback_Err, stat:haxe.extern.EitherType<externs.type.Uv_FsStat_Result, Void>) -> Dynamic;