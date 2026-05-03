package externs.type;

@:native("lsp.DocumentFilter") extern typedef Lsp_DocumentFilter = haxe.extern.EitherType<externs.type.Lsp_TextDocumentFilter, externs.type.Lsp_NotebookCellTextDocumentFilter>;