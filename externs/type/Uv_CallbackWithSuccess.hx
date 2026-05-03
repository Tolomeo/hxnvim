package externs.type;

@:native("uv.callback_with_success") extern typedef Uv_CallbackWithSuccess = (err:externs.type.Uv_Callback_Err, success:externs.type.Uv_Callback_Success) -> Dynamic;