package externs.type;

/**
	```lua
	(class) lsp.RelatedFullDocumentDiagnosticReport
	```
	
	---
	
	A full diagnostic report with a set of related documents.
	
**/
@:structInit extern class Lsp_RelatedFullDocumentDiagnosticReport {
	/**
		```lua
		(field) lsp.RelatedFullDocumentDiagnosticReport.items: lsp.Diagnostic[]
		```
		
		---
		
		
		The actual items.
	**/
	extern var items : Array<externs.type.Lsp_Diagnostic>;
	/**
		```lua
		(field) lsp.RelatedFullDocumentDiagnosticReport.kind: "full"
		```
		
		---
		
		
		A full document diagnostic report.
	**/
	extern var kind : String;
	/**
		```lua
		(field) lsp.RelatedFullDocumentDiagnosticReport.relatedDocuments: table<string, lsp.FullDocumentDiagnosticReport|lsp.UnchangedDocumentDiagnosticReport>?
		```
		
		---
		
		
		Diagnostics of related documents. This information is useful
		in programming languages where code in a file A can generate
		diagnostics in a file B which A depends on. An example of
		such a language is C/C++ where marco definitions in a file
		a.cpp and result in errors in a header file b.hpp.
		
	**/
	extern var relatedDocuments : Null<lua.Table<externs.type.Lsp_DocumentUri, haxe.extern.EitherType<externs.type.Lsp_FullDocumentDiagnosticReport, externs.type.Lsp_UnchangedDocumentDiagnosticReport>>>;
	/**
		```lua
		(field) lsp.RelatedFullDocumentDiagnosticReport.resultId: string?
		```
		
		---
		
		
		An optional result id. If provided it will
		be sent on the next diagnostic request for the
		same document.
	**/
	extern var resultId : Null<String>;
}