package externs.type;

@:native("lsp.TextDocumentFilter") extern typedef Lsp_TextDocumentFilter = haxe.extern.EitherType<externs.type.Lsp_TextDocumentFilterLanguage, haxe.extern.EitherType<externs.type.Lsp_TextDocumentFilterScheme, externs.type.Lsp_TextDocumentFilterPattern>>;