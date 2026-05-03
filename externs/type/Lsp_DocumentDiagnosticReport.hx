package externs.type;

@:native("lsp.DocumentDiagnosticReport") extern typedef Lsp_DocumentDiagnosticReport = haxe.extern.EitherType<externs.type.Lsp_RelatedFullDocumentDiagnosticReport, externs.type.Lsp_RelatedUnchangedDocumentDiagnosticReport>;