package externs.type;

@:native("lsp.GlobPattern") extern typedef Lsp_GlobPattern = haxe.extern.EitherType<externs.type.Lsp_Pattern, externs.type.Lsp_RelativePattern>;