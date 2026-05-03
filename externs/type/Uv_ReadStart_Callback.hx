package externs.type;

@:native("uv.read_start.callback") extern typedef Uv_ReadStart_Callback = (err:externs.type.Uv_Callback_Err, data:String) -> Dynamic;