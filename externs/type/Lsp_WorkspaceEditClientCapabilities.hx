package externs.type;

/**
	```lua
	(class) lsp.WorkspaceEditClientCapabilities
	```
**/
extern class Lsp_WorkspaceEditClientCapabilities {
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.changeAnnotationSupport: (lsp.ChangeAnnotationsSupportOptions)?
		```
		
		---
		
		
		Whether the client in general supports change annotations on text edits,
		create file, rename file and delete file changes.
		
	**/
	extern var changeAnnotationSupport : Null<externs.type.Lsp_ChangeAnnotationsSupportOptions>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.documentChanges: boolean?
		```
		
		---
		
		
		The client supports versioned document changes in `WorkspaceEdit`s
	**/
	extern var documentChanges : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.failureHandling: ("abort"|"textOnlyTransactional"|"transactional"|"undo")?
		```
		
		---
		
		
		The failure handling strategy of a client if applying the workspace edit
		fails.
		
		
		---
		
		```lua
		lsp.FailureHandlingKind:
		    | "abort" -- Abort
		    | "transactional" -- Transactional
		    | "textOnlyTransactional" -- TextOnlyTransactional
		    | "undo" -- Undo
		```
	**/
	extern var failureHandling : Null<externs.type.Lsp_FailureHandlingKind>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.metadataSupport: boolean?
		```
		
		---
		
		
		Whether the client supports `WorkspaceEditMetadata` in `WorkspaceEdit`s.
		
	**/
	extern var metadataSupport : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.normalizesLineEndings: boolean?
		```
		
		---
		
		
		Whether the client normalizes line endings to the client specific
		setting.
		If set to `true` the client will normalize line ending characters
		in a workspace edit to the client-specified new line
		character.
		
	**/
	extern var normalizesLineEndings : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.resourceOperations: "create"|"delete"|"rename"[]?
		```
		
		---
		
		
		The resource operations the client supports. Clients should at least
		support 'create', 'rename' and 'delete' files and folders.
		
	**/
	extern var resourceOperations : Null<Array<externs.type.Lsp_ResourceOperationKind>>;
	/**
		```lua
		(field) lsp.WorkspaceEditClientCapabilities.snippetEditSupport: boolean?
		```
		
		---
		
		
		Whether the client supports snippets as text edits.
		
	**/
	extern var snippetEditSupport : Null<Bool>;
}