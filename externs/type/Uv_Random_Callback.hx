package externs.type;

@:native("uv.random.callback") extern typedef Uv_Random_Callback = (err:externs.type.Uv_Callback_Err, bytes:String) -> Dynamic;