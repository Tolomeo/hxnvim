package externs.type;

@:native("uv.socketpair.protocol") extern typedef Uv_Socketpair_Protocol = haxe.extern.EitherType<Float, haxe.extern.EitherType<Void, externs.type.Uv_Socket_Protocol>>;