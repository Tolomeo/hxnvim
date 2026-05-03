package externs.type;

@:native("uv.socketpair.socktype") extern typedef Uv_Socketpair_Socktype = haxe.extern.EitherType<externs.type.Uv_Socket_Type, haxe.extern.EitherType<Int, Void>>;