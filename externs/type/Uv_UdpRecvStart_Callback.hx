package externs.type;

extern typedef Uv_UdpRecvStart_Callback = (err:haxe.extern.EitherType<String, Void>, data:haxe.extern.EitherType<String, Void>, addr:haxe.extern.EitherType<externs.type.Uv_UdpRecvStart_Callback_Addr, Void>, flags:externs.type.Uv_UdpRecvStart_Callback_Flags) -> Dynamic;