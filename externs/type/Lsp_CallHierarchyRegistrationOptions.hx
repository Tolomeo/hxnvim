package externs.type;

/**
	```lua
	(class) lsp.CallHierarchyRegistrationOptions
	```
	
	---
	
	Call hierarchy options used during static or dynamic registration.
	
**/
@:native("lsp.CallHierarchyRegistrationOptions") extern class Lsp_CallHierarchyRegistrationOptions {
	/**
		```lua
		(field) lsp.CallHierarchyRegistrationOptions.documentSelector: lsp.NotebookCellTextDocumentFilter|lsp.TextDocumentFilterLanguage|lsp.TextDocumentFilterPattern|lsp.TextDocumentFilterScheme[]|nil
		```
		
		---
		
		A document selector is the combination of one or many document filters.
		
		\@sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language: 'json', pattern: '**∕tsconfig.json' }]`;
		
		The use of a string as a document filter is deprecated @since 3.16.0.
		
		---
		
		
		A document selector to identify the scope of the registration. If set to null
		the document selector provided on the client side will be used.
	**/
	extern var documentSelector : haxe.extern.EitherType<externs.type.Lsp_DocumentSelector, externs.type.Lsp_Null>;
	/**
		```lua
		(field) lsp.CallHierarchyRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	extern var id : Null<String>;
	/**
		```lua
		(field) lsp.CallHierarchyRegistrationOptions.workDoneProgress: boolean?
		```
	**/
	extern var workDoneProgress : Null<Bool>;
}