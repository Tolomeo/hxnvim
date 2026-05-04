package externs.type;

extern typedef Vim_Validate_Validator = haxe.extern.EitherType<externs.type.Type, haxe.extern.EitherType<String, haxe.extern.EitherType<Array<haxe.extern.EitherType<externs.type.Type, String>>, (v:Any) -> vim._internal.Multireturn<Bool, Null<String>>>>>;