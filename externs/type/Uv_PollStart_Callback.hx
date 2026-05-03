package externs.type;

@:native("uv.poll_start.callback") extern typedef Uv_PollStart_Callback = (err:externs.type.Uv_Callback_Err, events:String) -> Dynamic;