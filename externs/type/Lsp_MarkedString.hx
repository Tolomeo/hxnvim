package externs.type;

@:native("lsp.MarkedString") extern typedef Lsp_MarkedString = haxe.extern.EitherType<String, externs.type.Lsp_MarkedStringWithLanguage>;