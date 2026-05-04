package externs.type;

extern typedef Lsp_LSPAny = haxe.extern.EitherType<externs.type.Lsp_LSPObject, haxe.extern.EitherType<externs.type.Lsp_LSPArray, haxe.extern.EitherType<String, haxe.extern.EitherType<Int, haxe.extern.EitherType<externs.type.Uinteger, haxe.extern.EitherType<externs.type.Decimal, haxe.extern.EitherType<Bool, externs.type.Lsp_Null>>>>>>>;