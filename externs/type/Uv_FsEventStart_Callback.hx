package externs.type;

extern typedef Uv_FsEventStart_Callback = (err:externs.type.Uv_Callback_Err, filename:String, events:externs.type.Uv_FsEventStart_Callback_Events) -> Dynamic;