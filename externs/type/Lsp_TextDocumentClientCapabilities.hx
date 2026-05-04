package externs.type;

/**
	```lua
	(class) lsp.TextDocumentClientCapabilities
	```
	
	---
	
	Text document specific client capabilities.
**/
@:structInit extern class Lsp_TextDocumentClientCapabilities {
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.callHierarchy: (lsp.CallHierarchyClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the various call hierarchy requests.
		
	**/
	extern var callHierarchy : Null<externs.type.Lsp_CallHierarchyClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.codeAction: (lsp.CodeActionClientCapabilities)?
		```
		
		---
		
		The Client Capabilities of a {@link CodeActionRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/codeAction` request.
	**/
	extern var codeAction : Null<externs.type.Lsp_CodeActionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.codeLens: (lsp.CodeLensClientCapabilities)?
		```
		
		---
		
		The client capabilities  of a {@link CodeLensRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/codeLens` request.
	**/
	extern var codeLens : Null<externs.type.Lsp_CodeLensClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.colorProvider: (lsp.DocumentColorClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/documentColor` and the
		`textDocument/colorPresentation` request.
		
	**/
	extern var colorProvider : Null<externs.type.Lsp_DocumentColorClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.completion: (lsp.CompletionClientCapabilities)?
		```
		
		---
		
		Completion client capabilities
		
		---
		
		
		Capabilities specific to the `textDocument/completion` request.
	**/
	extern var completion : Null<externs.type.Lsp_CompletionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.declaration: (lsp.DeclarationClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/declaration` request.
		
	**/
	extern var declaration : Null<externs.type.Lsp_DeclarationClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.definition: (lsp.DefinitionClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link DefinitionRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/definition` request.
	**/
	extern var definition : Null<externs.type.Lsp_DefinitionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.diagnostic: (lsp.DiagnosticClientCapabilities)?
		```
		
		---
		
		Client capabilities specific to diagnostic pull requests.
		
		
		---
		
		
		Capabilities specific to the diagnostic pull model.
		
	**/
	extern var diagnostic : Null<externs.type.Lsp_DiagnosticClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.documentHighlight: (lsp.DocumentHighlightClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link DocumentHighlightRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/documentHighlight` request.
	**/
	extern var documentHighlight : Null<externs.type.Lsp_DocumentHighlightClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.documentLink: (lsp.DocumentLinkClientCapabilities)?
		```
		
		---
		
		The client capabilities of a {@link DocumentLinkRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/documentLink` request.
	**/
	extern var documentLink : Null<externs.type.Lsp_DocumentLinkClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.documentSymbol: (lsp.DocumentSymbolClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link DocumentSymbolRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/documentSymbol` request.
	**/
	extern var documentSymbol : Null<externs.type.Lsp_DocumentSymbolClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.filters: (lsp.TextDocumentFilterClientCapabilities)?
		```
		
		---
		
		
		Defines which filters the client supports.
		
	**/
	extern var filters : Null<externs.type.Lsp_TextDocumentFilterClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.foldingRange: (lsp.FoldingRangeClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/foldingRange` request.
		
	**/
	extern var foldingRange : Null<externs.type.Lsp_FoldingRangeClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.formatting: (lsp.DocumentFormattingClientCapabilities)?
		```
		
		---
		
		Client capabilities of a {@link DocumentFormattingRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/formatting` request.
	**/
	extern var formatting : Null<externs.type.Lsp_DocumentFormattingClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.hover: (lsp.HoverClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/hover` request.
	**/
	extern var hover : Null<externs.type.Lsp_HoverClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.implementation: (lsp.ImplementationClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/implementation` request.
		
	**/
	extern var implementation : Null<externs.type.Lsp_ImplementationClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.inlayHint: (lsp.InlayHintClientCapabilities)?
		```
		
		---
		
		Inlay hint client capabilities.
		
		
		---
		
		
		Capabilities specific to the `textDocument/inlayHint` request.
		
	**/
	extern var inlayHint : Null<externs.type.Lsp_InlayHintClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.inlineCompletion: (lsp.InlineCompletionClientCapabilities)?
		```
		
		---
		
		Client capabilities specific to inline completions.
		
		
		---
		
		
		Client capabilities specific to inline completions.
		
	**/
	extern var inlineCompletion : Null<externs.type.Lsp_InlineCompletionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.inlineValue: (lsp.InlineValueClientCapabilities)?
		```
		
		---
		
		Client capabilities specific to inline values.
		
		
		---
		
		
		Capabilities specific to the `textDocument/inlineValue` request.
		
	**/
	extern var inlineValue : Null<externs.type.Lsp_InlineValueClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.linkedEditingRange: (lsp.LinkedEditingRangeClientCapabilities)?
		```
		
		---
		
		Client capabilities for the linked editing range request.
		
		
		---
		
		
		Capabilities specific to the `textDocument/linkedEditingRange` request.
		
	**/
	extern var linkedEditingRange : Null<externs.type.Lsp_LinkedEditingRangeClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.moniker: (lsp.MonikerClientCapabilities)?
		```
		
		---
		
		Client capabilities specific to the moniker request.
		
		
		---
		
		
		Client capabilities specific to the `textDocument/moniker` request.
		
	**/
	extern var moniker : Null<externs.type.Lsp_MonikerClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.onTypeFormatting: (lsp.DocumentOnTypeFormattingClientCapabilities)?
		```
		
		---
		
		Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/onTypeFormatting` request.
	**/
	extern var onTypeFormatting : Null<externs.type.Lsp_DocumentOnTypeFormattingClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.publishDiagnostics: (lsp.PublishDiagnosticsClientCapabilities)?
		```
		
		---
		
		The publish diagnostic client capabilities.
		
		---
		
		
		Capabilities specific to the `textDocument/publishDiagnostics` notification.
	**/
	extern var publishDiagnostics : Null<externs.type.Lsp_PublishDiagnosticsClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.rangeFormatting: (lsp.DocumentRangeFormattingClientCapabilities)?
		```
		
		---
		
		Client capabilities of a {@link DocumentRangeFormattingRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/rangeFormatting` request.
	**/
	extern var rangeFormatting : Null<externs.type.Lsp_DocumentRangeFormattingClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.references: (lsp.ReferenceClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link ReferencesRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/references` request.
	**/
	extern var references : Null<externs.type.Lsp_ReferenceClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.rename: (lsp.RenameClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/rename` request.
	**/
	extern var rename : Null<externs.type.Lsp_RenameClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.selectionRange: (lsp.SelectionRangeClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the `textDocument/selectionRange` request.
		
	**/
	extern var selectionRange : Null<externs.type.Lsp_SelectionRangeClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.semanticTokens: (lsp.SemanticTokensClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the various semantic token request.
		
	**/
	extern var semanticTokens : Null<externs.type.Lsp_SemanticTokensClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.signatureHelp: (lsp.SignatureHelpClientCapabilities)?
		```
		
		---
		
		Client Capabilities for a {@link SignatureHelpRequest}.
		
		---
		
		
		Capabilities specific to the `textDocument/signatureHelp` request.
	**/
	extern var signatureHelp : Null<externs.type.Lsp_SignatureHelpClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.synchronization: (lsp.TextDocumentSyncClientCapabilities)?
		```
		
		---
		
		
		Defines which synchronization capabilities the client supports.
	**/
	extern var synchronization : Null<externs.type.Lsp_TextDocumentSyncClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.typeDefinition: (lsp.TypeDefinitionClientCapabilities)?
		```
		
		---
		
		Since 3.6.0
		
		---
		
		
		Capabilities specific to the `textDocument/typeDefinition` request.
		
	**/
	extern var typeDefinition : Null<externs.type.Lsp_TypeDefinitionClientCapabilities>;
	/**
		```lua
		(field) lsp.TextDocumentClientCapabilities.typeHierarchy: (lsp.TypeHierarchyClientCapabilities)?
		```
		
		---
		
		
		Capabilities specific to the various type hierarchy requests.
		
	**/
	extern var typeHierarchy : Null<externs.type.Lsp_TypeHierarchyClientCapabilities>;
}