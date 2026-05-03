package externs.type;

@:native("uv.getaddrinfo.callback") extern typedef Uv_Getaddrinfo_Callback = (err:externs.type.Uv_Callback_Err, addresses:haxe.extern.EitherType<Array<externs.type.Uv_Getaddrinfo_Result>, Void>) -> Dynamic;