package externs.type;

@:native("uv.getnameinfo.callback") extern typedef Uv_Getnameinfo_Callback = (err:externs.type.Uv_Callback_Err, host:String, service:String) -> Dynamic;