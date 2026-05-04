package externs.type;

/**
	```lua
	(class) lsp.ServerCapabilities
	```
	
	---
	
	Defines the capabilities provided by a language
	server.
**/
extern class Lsp_ServerCapabilities {
	/**
		```lua
		(field) lsp.ServerCapabilities.callHierarchyProvider: (boolean|lsp.CallHierarchyOptions|lsp.CallHierarchyRegistrationOptions)?
		```
		
		---
		
		Call hierarchy options used during static registration.
		
		
		---
		
		
		The server provides call hierarchy support.
		
		
		---
		
		Call hierarchy options used during static or dynamic registration.
		
	**/
	extern var callHierarchyProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_CallHierarchyOptions, externs.type.Lsp_CallHierarchyRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.codeActionProvider: (boolean|lsp.CodeActionOptions)?
		```
		
		---
		
		Provider options for a {@link CodeActionRequest}.
		
		---
		
		
		The server provides code actions. CodeActionOptions may only be
		specified if the client states that it supports
		`codeActionLiteralSupport` in its initial `initialize` request.
	**/
	extern var codeActionProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_CodeActionOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.codeLensProvider: (lsp.CodeLensOptions)?
		```
		
		---
		
		Code Lens provider options of a {@link CodeLensRequest}.
		
		---
		
		
		The server provides code lens.
	**/
	extern var codeLensProvider : Null<externs.type.Lsp_CodeLensOptions>;
	/**
		```lua
		(field) lsp.ServerCapabilities.colorProvider: (boolean|lsp.DocumentColorOptions|lsp.DocumentColorRegistrationOptions)?
		```
		
		---
		
		
		The server provides color provider support.
	**/
	extern var colorProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_DocumentColorOptions, externs.type.Lsp_DocumentColorRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.completionProvider: (lsp.CompletionOptions)?
		```
		
		---
		
		Completion options.
		
		---
		
		
		The server provides completion support.
	**/
	extern var completionProvider : Null<externs.type.Lsp_CompletionOptions>;
	/**
		```lua
		(field) lsp.ServerCapabilities.declarationProvider: (boolean|lsp.DeclarationOptions|lsp.DeclarationRegistrationOptions)?
		```
		
		---
		
		
		The server provides Goto Declaration support.
	**/
	extern var declarationProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_DeclarationOptions, externs.type.Lsp_DeclarationRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.definitionProvider: (boolean|lsp.DefinitionOptions)?
		```
		
		---
		
		Server Capabilities for a {@link DefinitionRequest}.
		
		---
		
		
		The server provides goto definition support.
	**/
	extern var definitionProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_DefinitionOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.diagnosticProvider: (lsp.DiagnosticOptions|lsp.DiagnosticRegistrationOptions)?
		```
		
		---
		
		Diagnostic options.
		
		
		---
		
		
		The server has support for pull model diagnostics.
		
		
		---
		
		Diagnostic registration options.
		
	**/
	extern var diagnosticProvider : Null<haxe.extern.EitherType<externs.type.Lsp_DiagnosticOptions, externs.type.Lsp_DiagnosticRegistrationOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.documentFormattingProvider: (boolean|lsp.DocumentFormattingOptions)?
		```
		
		---
		
		Provider options for a {@link DocumentFormattingRequest}.
		
		---
		
		
		The server provides document formatting.
	**/
	extern var documentFormattingProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_DocumentFormattingOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.documentHighlightProvider: (boolean|lsp.DocumentHighlightOptions)?
		```
		
		---
		
		Provider options for a {@link DocumentHighlightRequest}.
		
		---
		
		
		The server provides document highlight support.
	**/
	extern var documentHighlightProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_DocumentHighlightOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.documentLinkProvider: (lsp.DocumentLinkOptions)?
		```
		
		---
		
		Provider options for a {@link DocumentLinkRequest}.
		
		---
		
		
		The server provides document link support.
	**/
	extern var documentLinkProvider : Null<externs.type.Lsp_DocumentLinkOptions>;
	/**
		```lua
		(field) lsp.ServerCapabilities.documentOnTypeFormattingProvider: (lsp.DocumentOnTypeFormattingOptions)?
		```
		
		---
		
		Provider options for a {@link DocumentOnTypeFormattingRequest}.
		
		---
		
		
		The server provides document formatting on typing.
	**/
	extern var documentOnTypeFormattingProvider : Null<externs.type.Lsp_DocumentOnTypeFormattingOptions>;
	/**
		```lua
		(field) lsp.ServerCapabilities.documentRangeFormattingProvider: (boolean|lsp.DocumentRangeFormattingOptions)?
		```
		
		---
		
		Provider options for a {@link DocumentRangeFormattingRequest}.
		
		---
		
		
		The server provides document range formatting.
	**/
	extern var documentRangeFormattingProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_DocumentRangeFormattingOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.documentSymbolProvider: (boolean|lsp.DocumentSymbolOptions)?
		```
		
		---
		
		Provider options for a {@link DocumentSymbolRequest}.
		
		---
		
		
		The server provides document symbol support.
	**/
	extern var documentSymbolProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_DocumentSymbolOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.executeCommandProvider: (lsp.ExecuteCommandOptions)?
		```
		
		---
		
		The server capabilities of a {@link ExecuteCommandRequest}.
		
		---
		
		
		The server provides execute command support.
	**/
	extern var executeCommandProvider : Null<externs.type.Lsp_ExecuteCommandOptions>;
	/**
		```lua
		(field) lsp.ServerCapabilities.experimental: (boolean|string|number|boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		The LSP any type.
		Please note that strictly speaking a property with the value `undefined`
		can't be converted into JSON preserving the property name. However for
		convenience it is allowed and assumed that all these properties are
		optional as well.
		
		---
		
		
		Experimental server capabilities.
		
		---
		
		LSP object definition.
		
		---
		
		LSP arrays.
	**/
	extern var experimental : Null<externs.type.Lsp_LSPAny>;
	/**
		```lua
		(field) lsp.ServerCapabilities.foldingRangeProvider: (boolean|lsp.FoldingRangeOptions|lsp.FoldingRangeRegistrationOptions)?
		```
		
		---
		
		
		The server provides folding provider support.
	**/
	extern var foldingRangeProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_FoldingRangeOptions, externs.type.Lsp_FoldingRangeRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.hoverProvider: (boolean|lsp.HoverOptions)?
		```
		
		---
		
		Hover options.
		
		---
		
		
		The server provides hover support.
	**/
	extern var hoverProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_HoverOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.implementationProvider: (boolean|lsp.ImplementationOptions|lsp.ImplementationRegistrationOptions)?
		```
		
		---
		
		
		The server provides Goto Implementation support.
	**/
	extern var implementationProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_ImplementationOptions, externs.type.Lsp_ImplementationRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.inlayHintProvider: (boolean|lsp.InlayHintOptions|lsp.InlayHintRegistrationOptions)?
		```
		
		---
		
		Inlay hint options used during static registration.
		
		
		---
		
		
		The server provides inlay hints.
		
		
		---
		
		Inlay hint options used during static or dynamic registration.
		
	**/
	extern var inlayHintProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_InlayHintOptions, externs.type.Lsp_InlayHintRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.inlineCompletionProvider: (boolean|lsp.InlineCompletionOptions)?
		```
		
		---
		
		Inline completion options used during static registration.
		
		
		---
		
		
		Inline completion options used during static registration.
		
	**/
	extern var inlineCompletionProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_InlineCompletionOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.inlineValueProvider: (boolean|lsp.InlineValueOptions|lsp.InlineValueRegistrationOptions)?
		```
		
		---
		
		Inline value options used during static registration.
		
		
		---
		
		
		The server provides inline values.
		
		
		---
		
		Inline value options used during static or dynamic registration.
		
	**/
	extern var inlineValueProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_InlineValueOptions, externs.type.Lsp_InlineValueRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.linkedEditingRangeProvider: (boolean|lsp.LinkedEditingRangeOptions|lsp.LinkedEditingRangeRegistrationOptions)?
		```
		
		---
		
		
		The server provides linked editing range support.
		
	**/
	extern var linkedEditingRangeProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_LinkedEditingRangeOptions, externs.type.Lsp_LinkedEditingRangeRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.monikerProvider: (boolean|lsp.MonikerOptions|lsp.MonikerRegistrationOptions)?
		```
		
		---
		
		
		The server provides moniker support.
		
	**/
	extern var monikerProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_MonikerOptions, externs.type.Lsp_MonikerRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.notebookDocumentSync: (lsp.NotebookDocumentSyncOptions|lsp.NotebookDocumentSyncRegistrationOptions)?
		```
		
		---
		
		Options specific to a notebook plus its cells
		to be synced to the server.
		
		If a selector provides a notebook document
		filter but no cell selector all cells of a
		matching notebook document will be synced.
		
		If a selector provides no notebook document
		filter but only a cell selector all notebook
		document that contain at least one matching
		cell will be synced.
		
		
		---
		
		
		Defines how notebook documents are synced.
		
		
		---
		
		Registration options specific to a notebook.
		
	**/
	extern var notebookDocumentSync : Null<haxe.extern.EitherType<externs.type.Lsp_NotebookDocumentSyncOptions, externs.type.Lsp_NotebookDocumentSyncRegistrationOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.positionEncoding: ("utf-16"|"utf-32"|"utf-8")?
		```
		
		---
		
		A set of predefined position encoding kinds.
		
		
		---
		
		
		The position encoding the server picked from the encodings offered
		by the client via the client capability `general.positionEncodings`.
		
		If the client didn't provide any position encodings the only valid
		value that a server can return is 'utf-16'.
		
		If omitted it defaults to 'utf-16'.
		
		
		---
		
		```lua
		-- A set of predefined position encoding kinds.
		-- 
		lsp.PositionEncodingKind:
		    | "utf-8" -- UTF8
		    | "utf-16" -- UTF16
		    | "utf-32" -- UTF32
		```
	**/
	extern var positionEncoding : Null<externs.type.Lsp_PositionEncodingKind>;
	/**
		```lua
		(field) lsp.ServerCapabilities.referencesProvider: (boolean|lsp.ReferenceOptions)?
		```
		
		---
		
		Reference options.
		
		---
		
		
		The server provides find references support.
	**/
	extern var referencesProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_ReferenceOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.renameProvider: (boolean|lsp.RenameOptions)?
		```
		
		---
		
		Provider options for a {@link RenameRequest}.
		
		---
		
		
		The server provides rename support. RenameOptions may only be
		specified if the client states that it supports
		`prepareSupport` in its initial `initialize` request.
	**/
	extern var renameProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_RenameOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.selectionRangeProvider: (boolean|lsp.SelectionRangeOptions|lsp.SelectionRangeRegistrationOptions)?
		```
		
		---
		
		
		The server provides selection range support.
	**/
	extern var selectionRangeProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_SelectionRangeOptions, externs.type.Lsp_SelectionRangeRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.semanticTokensProvider: (lsp.SemanticTokensOptions|lsp.SemanticTokensRegistrationOptions)?
		```
		
		---
		
		
		The server provides semantic tokens support.
		
	**/
	extern var semanticTokensProvider : Null<haxe.extern.EitherType<externs.type.Lsp_SemanticTokensOptions, externs.type.Lsp_SemanticTokensRegistrationOptions>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.signatureHelpProvider: (lsp.SignatureHelpOptions)?
		```
		
		---
		
		Server Capabilities for a {@link SignatureHelpRequest}.
		
		---
		
		
		The server provides signature help support.
	**/
	extern var signatureHelpProvider : Null<externs.type.Lsp_SignatureHelpOptions>;
	/**
		```lua
		(field) lsp.ServerCapabilities.textDocumentSync: (0|1|2|lsp.TextDocumentSyncOptions)?
		```
		
		---
		
		Defines how the host (editor) should sync
		document changes to the language server.
		
		---
		
		
		Defines how text documents are synced. Is either a detailed structure
		defining each notification or for backwards compatibility the
		TextDocumentSyncKind number.
		
		---
		
		```lua
		-- Defines how the host (editor) should sync
		-- document changes to the language server.
		lsp.TextDocumentSyncKind:
		    | 0 -- None
		    | 1 -- Full
		    | 2 -- Incremental
		```
	**/
	extern var textDocumentSync : Null<haxe.extern.EitherType<externs.type.Lsp_TextDocumentSyncOptions, externs.type.Lsp_TextDocumentSyncKind>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.typeDefinitionProvider: (boolean|lsp.TypeDefinitionOptions|lsp.TypeDefinitionRegistrationOptions)?
		```
		
		---
		
		
		The server provides Goto Type Definition support.
	**/
	extern var typeDefinitionProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_TypeDefinitionOptions, externs.type.Lsp_TypeDefinitionRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.typeHierarchyProvider: (boolean|lsp.TypeHierarchyOptions|lsp.TypeHierarchyRegistrationOptions)?
		```
		
		---
		
		Type hierarchy options used during static registration.
		
		
		---
		
		
		The server provides type hierarchy support.
		
		
		---
		
		Type hierarchy options used during static or dynamic registration.
		
	**/
	extern var typeHierarchyProvider : Null<haxe.extern.EitherType<Bool, haxe.extern.EitherType<externs.type.Lsp_TypeHierarchyOptions, externs.type.Lsp_TypeHierarchyRegistrationOptions>>>;
	/**
		```lua
		(field) lsp.ServerCapabilities.workspace: (lsp.WorkspaceOptions)?
		```
		
		---
		
		Defines workspace specific capabilities of the server.
		
		
		---
		
		
		Workspace specific server capabilities.
	**/
	extern var workspace : Null<externs.type.Lsp_WorkspaceOptions>;
	/**
		```lua
		(field) lsp.ServerCapabilities.workspaceSymbolProvider: (boolean|lsp.WorkspaceSymbolOptions)?
		```
		
		---
		
		Server capabilities for a {@link WorkspaceSymbolRequest}.
		
		---
		
		
		The server provides workspace symbol support.
	**/
	extern var workspaceSymbolProvider : Null<haxe.extern.EitherType<Bool, externs.type.Lsp_WorkspaceSymbolOptions>>;
}