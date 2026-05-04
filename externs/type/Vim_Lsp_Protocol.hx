package externs.type;

@:private extern class WatchKind {
	/**
		```lua
		(field) WatchKind.Change: unknown
		```
	**/
	extern var Change : Dynamic;
	/**
		```lua
		(field) WatchKind.Create: unknown
		```
	**/
	extern var Create : Dynamic;
	/**
		```lua
		(field) WatchKind.Delete: unknown
		```
	**/
	extern var Delete : Dynamic;
}

@:private extern class TextDocumentSyncKind {
	/**
		```lua
		(field) TextDocumentSyncKind.Full: unknown
		```
	**/
	extern var Full : Dynamic;
	/**
		```lua
		(field) TextDocumentSyncKind.Incremental: unknown
		```
	**/
	extern var Incremental : Dynamic;
	/**
		```lua
		(field) TextDocumentSyncKind.None: unknown
		```
	**/
	extern var None : Dynamic;
}

@:private extern class TextDocumentSaveReason {
	/**
		```lua
		(field) TextDocumentSaveReason.AfterDelay: unknown
		```
	**/
	extern var AfterDelay : Dynamic;
	/**
		```lua
		(field) TextDocumentSaveReason.FocusOut: unknown
		```
	**/
	extern var FocusOut : Dynamic;
	/**
		```lua
		(field) TextDocumentSaveReason.Manual: unknown
		```
	**/
	extern var Manual : Dynamic;
}

@:private extern class SymbolKind {
	/**
		```lua
		(field) SymbolKind.Array: unknown
		```
	**/
	extern var Array : Dynamic;
	/**
		```lua
		(field) SymbolKind.Boolean: unknown
		```
	**/
	extern var Boolean : Dynamic;
	/**
		```lua
		(field) SymbolKind.Class: unknown
		```
	**/
	extern var Class : Dynamic;
	/**
		```lua
		(field) SymbolKind.Constant: unknown
		```
	**/
	extern var Constant : Dynamic;
	/**
		```lua
		(field) SymbolKind.Constructor: unknown
		```
	**/
	extern var Constructor : Dynamic;
	/**
		```lua
		(field) SymbolKind.Enum: unknown
		```
	**/
	extern var Enum : Dynamic;
	/**
		```lua
		(field) SymbolKind.EnumMember: unknown
		```
	**/
	extern var EnumMember : Dynamic;
	/**
		```lua
		(field) SymbolKind.Event: unknown
		```
	**/
	extern var Event : Dynamic;
	/**
		```lua
		(field) SymbolKind.Field: unknown
		```
	**/
	extern var Field : Dynamic;
	/**
		```lua
		(field) SymbolKind.File: unknown
		```
	**/
	extern var File : Dynamic;
	/**
		```lua
		(field) SymbolKind.Function: unknown
		```
	**/
	extern var Function : Dynamic;
	/**
		```lua
		(field) SymbolKind.Interface: unknown
		```
	**/
	extern var Interface : Dynamic;
	/**
		```lua
		(field) SymbolKind.Key: unknown
		```
	**/
	extern var Key : Dynamic;
	/**
		```lua
		(field) SymbolKind.Method: unknown
		```
	**/
	extern var Method : Dynamic;
	/**
		```lua
		(field) SymbolKind.Module: unknown
		```
	**/
	extern var Module : Dynamic;
	/**
		```lua
		(field) SymbolKind.Namespace: unknown
		```
	**/
	extern var Namespace : Dynamic;
	/**
		```lua
		(field) SymbolKind.Null: unknown
		```
	**/
	extern var Null : Dynamic;
	/**
		```lua
		(field) SymbolKind.Number: unknown
		```
	**/
	extern var Number : Dynamic;
	/**
		```lua
		(field) SymbolKind.Object: unknown
		```
	**/
	extern var Object : Dynamic;
	/**
		```lua
		(field) SymbolKind.Operator: unknown
		```
	**/
	extern var Operator : Dynamic;
	/**
		```lua
		(field) SymbolKind.Package: unknown
		```
	**/
	extern var Package : Dynamic;
	/**
		```lua
		(field) SymbolKind.Property: unknown
		```
	**/
	extern var Property : Dynamic;
	/**
		```lua
		(field) SymbolKind.String: unknown
		```
	**/
	extern var String : Dynamic;
	/**
		```lua
		(field) SymbolKind.Struct: unknown
		```
	**/
	extern var Struct : Dynamic;
	/**
		```lua
		(field) SymbolKind.TypeParameter: unknown
		```
	**/
	extern var TypeParameter : Dynamic;
	/**
		```lua
		(field) SymbolKind.Variable: unknown
		```
	**/
	extern var Variable : Dynamic;
}

@:private extern class ResourceOperationKind {
	/**
		```lua
		(field) ResourceOperationKind.Create: unknown
		```
	**/
	extern var Create : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.Delete: unknown
		```
	**/
	extern var Delete : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.Rename: unknown
		```
	**/
	extern var Rename : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.create: unknown
		```
	**/
	extern var create : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.delete: unknown
		```
	**/
	extern var delete : Dynamic;
	/**
		```lua
		(field) ResourceOperationKind.rename: unknown
		```
	**/
	extern var rename : Dynamic;
}

@:private extern class RequestNameToCapability {

}

@:private extern class Methods {
	extern var callHierarchy_incomingCalls : externs.type.Vim_Lsp_Protocol_Methods;
	extern var callHierarchy_outgoingCalls : externs.type.Vim_Lsp_Protocol_Methods;
	extern var client_registerCapability : externs.type.Vim_Lsp_Protocol_Methods;
	extern var client_unregisterCapability : externs.type.Vim_Lsp_Protocol_Methods;
	extern var codeAction_resolve : externs.type.Vim_Lsp_Protocol_Methods;
	extern var codeLens_resolve : externs.type.Vim_Lsp_Protocol_Methods;
	extern var completionItem_resolve : externs.type.Vim_Lsp_Protocol_Methods;
	extern var documentLink_resolve : externs.type.Vim_Lsp_Protocol_Methods;
	extern var dollar_cancelRequest : externs.type.Vim_Lsp_Protocol_Methods;
	extern var dollar_logTrace : externs.type.Vim_Lsp_Protocol_Methods;
	extern var dollar_progress : externs.type.Vim_Lsp_Protocol_Methods;
	extern var dollar_setTrace : externs.type.Vim_Lsp_Protocol_Methods;
	extern var exit : externs.type.Vim_Lsp_Protocol_Methods;
	extern var initialize : externs.type.Vim_Lsp_Protocol_Methods;
	extern var initialized : externs.type.Vim_Lsp_Protocol_Methods;
	extern var inlayHint_resolve : externs.type.Vim_Lsp_Protocol_Methods;
	extern var notebookDocument_didChange : externs.type.Vim_Lsp_Protocol_Methods;
	extern var notebookDocument_didClose : externs.type.Vim_Lsp_Protocol_Methods;
	extern var notebookDocument_didOpen : externs.type.Vim_Lsp_Protocol_Methods;
	extern var notebookDocument_didSave : externs.type.Vim_Lsp_Protocol_Methods;
	extern var shutdown : externs.type.Vim_Lsp_Protocol_Methods;
	extern var telemetry_event : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_codeAction : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_codeLens : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_colorPresentation : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_completion : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_declaration : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_definition : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_diagnostic : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_didChange : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_didClose : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_didOpen : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_didSave : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_documentColor : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_documentHighlight : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_documentLink : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_documentSymbol : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_foldingRange : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_formatting : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_hover : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_implementation : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_inlayHint : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_inlineCompletion : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_inlineValue : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_linkedEditingRange : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_moniker : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_onTypeFormatting : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_prepareCallHierarchy : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_prepareRename : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_prepareTypeHierarchy : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_publishDiagnostics : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_rangeFormatting : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_rangesFormatting : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_references : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_rename : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_selectionRange : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_semanticTokens_full : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_semanticTokens_full_delta : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_semanticTokens_range : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_signatureHelp : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_typeDefinition : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_willSave : externs.type.Vim_Lsp_Protocol_Methods;
	extern var textDocument_willSaveWaitUntil : externs.type.Vim_Lsp_Protocol_Methods;
	extern var typeHierarchy_subtypes : externs.type.Vim_Lsp_Protocol_Methods;
	extern var typeHierarchy_supertypes : externs.type.Vim_Lsp_Protocol_Methods;
	extern var window_logMessage : externs.type.Vim_Lsp_Protocol_Methods;
	extern var window_showDocument : externs.type.Vim_Lsp_Protocol_Methods;
	extern var window_showMessage : externs.type.Vim_Lsp_Protocol_Methods;
	extern var window_showMessageRequest : externs.type.Vim_Lsp_Protocol_Methods;
	extern var window_workDoneProgress_cancel : externs.type.Vim_Lsp_Protocol_Methods;
	extern var window_workDoneProgress_create : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspaceSymbol_resolve : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_applyEdit : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_codeLens_refresh : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_configuration : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_diagnostic : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_diagnostic_refresh : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_didChangeConfiguration : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_didChangeWatchedFiles : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_didChangeWorkspaceFolders : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_didCreateFiles : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_didDeleteFiles : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_didRenameFiles : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_executeCommand : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_foldingRange_refresh : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_inlayHint_refresh : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_inlineValue_refresh : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_semanticTokens_refresh : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_symbol : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_textDocumentContent : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_textDocumentContent_refresh : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_willCreateFiles : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_willDeleteFiles : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_willRenameFiles : externs.type.Vim_Lsp_Protocol_Methods;
	extern var workspace_workspaceFolders : externs.type.Vim_Lsp_Protocol_Methods;
}

@:private extern class MessageType {
	/**
		```lua
		(field) MessageType.Debug: unknown
		```
	**/
	extern var Debug : Dynamic;
	/**
		```lua
		(field) MessageType.Error: unknown
		```
	**/
	extern var Error : Dynamic;
	/**
		```lua
		(field) MessageType.Info: unknown
		```
	**/
	extern var Info : Dynamic;
	/**
		```lua
		(field) MessageType.Log: unknown
		```
	**/
	extern var Log : Dynamic;
	/**
		```lua
		(field) MessageType.Warning: unknown
		```
	**/
	extern var Warning : Dynamic;
}

@:private extern class MarkupKind {
	/**
		```lua
		(field) MarkupKind.Markdown: unknown
		```
	**/
	extern var Markdown : Dynamic;
	/**
		```lua
		(field) MarkupKind.PlainText: unknown
		```
	**/
	extern var PlainText : Dynamic;
	/**
		```lua
		(field) MarkupKind.markdown: unknown
		```
	**/
	extern var markdown : Dynamic;
	/**
		```lua
		(field) MarkupKind.plaintext: unknown
		```
	**/
	extern var plaintext : Dynamic;
}

@:private extern class InsertTextFormat {
	/**
		```lua
		(field) InsertTextFormat.PlainText: unknown
		```
	**/
	extern var PlainText : Dynamic;
	/**
		```lua
		(field) InsertTextFormat.Snippet: unknown
		```
	**/
	extern var Snippet : Dynamic;
}

@:private extern class InitializeError {
	/**
		```lua
		(field) InitializeError.unknownProtocolVersion: unknown
		```
	**/
	extern var unknownProtocolVersion : Dynamic;
}

@:private extern class FileChangeType {
	/**
		```lua
		(field) FileChangeType.Changed: unknown
		```
	**/
	extern var Changed : Dynamic;
	/**
		```lua
		(field) FileChangeType.Created: unknown
		```
	**/
	extern var Created : Dynamic;
	/**
		```lua
		(field) FileChangeType.Deleted: unknown
		```
	**/
	extern var Deleted : Dynamic;
}

@:private extern class FailureHandlingKind {
	/**
		```lua
		(field) FailureHandlingKind.Abort: unknown
		```
	**/
	extern var Abort : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.TextOnlyTransactional: unknown
		```
	**/
	extern var TextOnlyTransactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.Transactional: unknown
		```
	**/
	extern var Transactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.Undo: unknown
		```
	**/
	extern var Undo : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.abort: unknown
		```
	**/
	extern var abort : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.textOnlyTransactional: unknown
		```
	**/
	extern var textOnlyTransactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.transactional: unknown
		```
	**/
	extern var transactional : Dynamic;
	/**
		```lua
		(field) FailureHandlingKind.undo: unknown
		```
	**/
	extern var undo : Dynamic;
}

@:private extern class ErrorCodes {
	/**
		```lua
		(field) ErrorCodes.ContentModified: unknown
		```
	**/
	extern var ContentModified : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InternalError: unknown
		```
	**/
	extern var InternalError : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InvalidParams: unknown
		```
	**/
	extern var InvalidParams : Dynamic;
	/**
		```lua
		(field) ErrorCodes.InvalidRequest: unknown
		```
	**/
	extern var InvalidRequest : Dynamic;
	/**
		```lua
		(field) ErrorCodes.MethodNotFound: unknown
		```
	**/
	extern var MethodNotFound : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ParseError: unknown
		```
	**/
	extern var ParseError : Dynamic;
	/**
		```lua
		(field) ErrorCodes.RequestCancelled: unknown
		```
	**/
	extern var RequestCancelled : Dynamic;
	/**
		```lua
		(field) ErrorCodes.RequestFailed: unknown
		```
	**/
	extern var RequestFailed : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ServerCancelled: unknown
		```
	**/
	extern var ServerCancelled : Dynamic;
	/**
		```lua
		(field) ErrorCodes.ServerNotInitialized: unknown
		```
	**/
	extern var ServerNotInitialized : Dynamic;
	/**
		```lua
		(field) ErrorCodes.UnknownErrorCode: unknown
		```
	**/
	extern var UnknownErrorCode : Dynamic;
}

@:private extern class DocumentHighlightKind {
	/**
		```lua
		(field) DocumentHighlightKind.Read: unknown
		```
	**/
	extern var Read : Dynamic;
	/**
		```lua
		(field) DocumentHighlightKind.Text: unknown
		```
	**/
	extern var Text : Dynamic;
	/**
		```lua
		(field) DocumentHighlightKind.Write: unknown
		```
	**/
	extern var Write : Dynamic;
}

@:private extern class DiagnosticTag {
	/**
		```lua
		(field) DiagnosticTag.Deprecated: unknown
		```
	**/
	extern var Deprecated : Dynamic;
	/**
		```lua
		(field) DiagnosticTag.Unnecessary: unknown
		```
	**/
	extern var Unnecessary : Dynamic;
}

@:private extern class DiagnosticSeverity {
	/**
		```lua
		(field) DiagnosticSeverity.Error: unknown
		```
	**/
	extern var Error : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Hint: unknown
		```
	**/
	extern var Hint : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Information: unknown
		```
	**/
	extern var Information : Dynamic;
	/**
		```lua
		(field) DiagnosticSeverity.Warning: unknown
		```
	**/
	extern var Warning : Dynamic;
}

@:private extern class CompletionTriggerKind {
	/**
		```lua
		(field) CompletionTriggerKind.Invoked: unknown
		```
	**/
	extern var Invoked : Dynamic;
	/**
		```lua
		(field) CompletionTriggerKind.TriggerCharacter: unknown
		```
	**/
	extern var TriggerCharacter : Dynamic;
	/**
		```lua
		(field) CompletionTriggerKind.TriggerForIncompleteCompletions: unknown
		```
	**/
	extern var TriggerForIncompleteCompletions : Dynamic;
}

@:private extern class CompletionTag {
	/**
		```lua
		(field) CompletionTag.Deprecated: unknown
		```
	**/
	extern var Deprecated : Dynamic;
}

@:private extern class CompletionItemKind {
	/**
		```lua
		(field) CompletionItemKind.Class: unknown
		```
	**/
	extern var Class : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Color: unknown
		```
	**/
	extern var Color : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Constant: unknown
		```
	**/
	extern var Constant : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Constructor: unknown
		```
	**/
	extern var Constructor : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Enum: unknown
		```
	**/
	extern var Enum : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.EnumMember: unknown
		```
	**/
	extern var EnumMember : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Event: unknown
		```
	**/
	extern var Event : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Field: unknown
		```
	**/
	extern var Field : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.File: unknown
		```
	**/
	extern var File : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Folder: unknown
		```
	**/
	extern var Folder : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Function: unknown
		```
	**/
	extern var Function : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Interface: unknown
		```
	**/
	extern var Interface : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Keyword: unknown
		```
	**/
	extern var Keyword : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Method: unknown
		```
	**/
	extern var Method : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Module: unknown
		```
	**/
	extern var Module : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Operator: unknown
		```
	**/
	extern var Operator : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Property: unknown
		```
	**/
	extern var Property : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Reference: unknown
		```
	**/
	extern var Reference : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Snippet: unknown
		```
	**/
	extern var Snippet : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Struct: unknown
		```
	**/
	extern var Struct : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Text: unknown
		```
	**/
	extern var Text : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.TypeParameter: unknown
		```
	**/
	extern var TypeParameter : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Unit: unknown
		```
	**/
	extern var Unit : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Value: unknown
		```
	**/
	extern var Value : Dynamic;
	/**
		```lua
		(field) CompletionItemKind.Variable: unknown
		```
	**/
	extern var Variable : Dynamic;
}

@:private extern class CodeActionTriggerKind {
	/**
		```lua
		(field) CodeActionTriggerKind.Automatic: unknown
		```
	**/
	extern var Automatic : Dynamic;
	/**
		```lua
		(field) CodeActionTriggerKind.Invoked: unknown
		```
	**/
	extern var Invoked : Dynamic;
}

@:private extern class CodeActionKind {
	/**
		```lua
		(field) CodeActionKind.Empty: unknown
		```
	**/
	extern var Empty : Dynamic;
	/**
		```lua
		(field) CodeActionKind.QuickFix: unknown
		```
	**/
	extern var QuickFix : Dynamic;
	/**
		```lua
		(field) CodeActionKind.Refactor: unknown
		```
	**/
	extern var Refactor : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorExtract: unknown
		```
	**/
	extern var RefactorExtract : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorInline: unknown
		```
	**/
	extern var RefactorInline : Dynamic;
	/**
		```lua
		(field) CodeActionKind.RefactorRewrite: unknown
		```
	**/
	extern var RefactorRewrite : Dynamic;
	/**
		```lua
		(field) CodeActionKind.Source: unknown
		```
	**/
	extern var Source : Dynamic;
	/**
		```lua
		(field) CodeActionKind.SourceOrganizeImports: unknown
		```
	**/
	extern var SourceOrganizeImports : Dynamic;
	/**
		```lua
		(field) CodeActionKind.quickfix: unknown
		```
	**/
	extern var quickfix : Dynamic;
	/**
		```lua
		(field) CodeActionKind.refactor: unknown
		```
	**/
	extern var refactor : Dynamic;
	/**
		```lua
		(field) CodeActionKind.source: unknown
		```
	**/
	extern var source : Dynamic;
}

/**
	```lua
	(class) vim.lsp.protocol
	```
	
	---
	
	 Protocol for the Microsoft Language Server Protocol (mslsp)
**/
@:structInit extern class Vim_Lsp_Protocol {
	/**
		```lua
		(field) vim.lsp.protocol.CodeActionKind: table
		```
		
		---
		
		 A set of predefined code action kinds
	**/
	extern var CodeActionKind : CodeActionKind;
	/**
		```lua
		(field) vim.lsp.protocol.CodeActionTriggerKind: table
		```
		
		---
		
		 The reason why code actions were requested.
	**/
	extern var CodeActionTriggerKind : CodeActionTriggerKind;
	/**
		```lua
		(field) vim.lsp.protocol.CompletionItemKind: table
		```
		
		---
		
		 The kind of a completion entry.
	**/
	extern var CompletionItemKind : CompletionItemKind;
	/**
		```lua
		(field) vim.lsp.protocol.CompletionTag: table
		```
		
		---
		
		 Completion item tags are extra annotations that tweak the rendering of a
		 completion item
	**/
	extern var CompletionTag : CompletionTag;
	/**
		```lua
		(field) vim.lsp.protocol.CompletionTriggerKind: table
		```
		
		---
		
		 How a completion was triggered
	**/
	extern var CompletionTriggerKind : CompletionTriggerKind;
	/**
		```lua
		(field) vim.lsp.protocol.DiagnosticSeverity: table
		```
	**/
	extern var DiagnosticSeverity : DiagnosticSeverity;
	/**
		```lua
		(field) vim.lsp.protocol.DiagnosticTag: table
		```
	**/
	extern var DiagnosticTag : DiagnosticTag;
	/**
		```lua
		(field) vim.lsp.protocol.DocumentHighlightKind: table
		```
		
		---
		
		 A document highlight kind.
	**/
	extern var DocumentHighlightKind : DocumentHighlightKind;
	/**
		```lua
		(field) vim.lsp.protocol.ErrorCodes: table
		```
	**/
	extern var ErrorCodes : ErrorCodes;
	/**
		```lua
		(field) vim.lsp.protocol.FailureHandlingKind: table
		```
	**/
	extern var FailureHandlingKind : FailureHandlingKind;
	/**
		```lua
		(field) vim.lsp.protocol.FileChangeType: table
		```
		
		---
		
		 The file event type.
	**/
	extern var FileChangeType : FileChangeType;
	/**
		```lua
		(field) vim.lsp.protocol.InitializeError: table
		```
		
		---
		
		 Known error codes for an `InitializeError`;
	**/
	extern var InitializeError : InitializeError;
	/**
		```lua
		(field) vim.lsp.protocol.InsertTextFormat: table
		```
		
		---
		
		 Defines whether the insert text in a completion item should be interpreted as
		 plain text or a snippet.
	**/
	extern var InsertTextFormat : InsertTextFormat;
	/**
		```lua
		(field) vim.lsp.protocol.MarkupKind: table
		```
		
		---
		
		 Describes the content type that a client supports in various
		 result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
		
		 Please note that `MarkupKinds` must not start with a `$`. This kinds
		 are reserved for internal usage.
	**/
	extern var MarkupKind : MarkupKind;
	/**
		```lua
		(field) vim.lsp.protocol.MessageType: table
		```
	**/
	extern var MessageType : MessageType;
	/**
		```lua
		(field) vim.lsp.protocol.Methods: table
		```
		
		---
		
		 LSP method names.
		See: ~https~ ://microsoft.github.io/language-server-protocol/specification/#metaModel
	**/
	extern var Methods : Methods;
	/**
		```lua
		(field) vim.lsp.protocol.ResourceOperationKind: table
		```
	**/
	extern var ResourceOperationKind : ResourceOperationKind;
	/**
		```lua
		(field) vim.lsp.protocol.SymbolKind: table
		```
		
		---
		
		 A symbol kind.
	**/
	extern var SymbolKind : SymbolKind;
	/**
		```lua
		(field) vim.lsp.protocol.TextDocumentSaveReason: table
		```
		
		---
		
		 Represents reasons why a text document is saved.
	**/
	extern var TextDocumentSaveReason : TextDocumentSaveReason;
	/**
		```lua
		(field) vim.lsp.protocol.TextDocumentSyncKind: table
		```
		
		---
		
		 Defines how the host (editor) should sync document changes to the language server.
	**/
	extern var TextDocumentSyncKind : TextDocumentSyncKind;
	/**
		```lua
		(field) vim.lsp.protocol.WatchKind: table
		```
	**/
	extern var WatchKind : WatchKind;
	/**
		```lua
		(field) vim.lsp.protocol._request_name_to_capability: table
		```
		
		---
		
		 stylua: ignore start
		 Generated by gen_lsp.lua, keep at end of file.
		 Maps method names to the required server capability
	**/
	extern var _request_name_to_capability : RequestNameToCapability;
	/**
		```lua
		function vim.lsp.protocol.make_client_capabilities()
		  -> lsp.ClientCapabilities
		```
		
		---
		
		 Gets a new ClientCapabilities object describing the LSP client
		 capabilities.
	**/
	extern static function make_client_capabilities():externs.type.Lsp_ClientCapabilities;
	/**
		```lua
		function vim.lsp.protocol.resolve_capabilities(server_capabilities: table)
		  -> lsp.ServerCapabilities|nil
		```
		
		---
		
		 Creates a normalized object describing LSP server capabilities.
		
		@*param* `server_capabilities` — Table of capabilities supported by the server
		
		@*return* — : Normalized table of capabilities
	**/
	extern static function resolve_capabilities(server_capabilities:lua.Table.AnyTable):haxe.extern.EitherType<externs.type.Lsp_ServerCapabilities, Void>;
}