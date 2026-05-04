package externs.type;

/**
	```lua
	(class) lsp.NotebookDocumentSyncRegistrationOptions
	```
	
	---
	
	Registration options specific to a notebook.
	
**/
extern class Lsp_NotebookDocumentSyncRegistrationOptions {
	/**
		```lua
		(field) lsp.NotebookDocumentSyncRegistrationOptions.id: string?
		```
		
		---
		
		
		The id used to register the request. The id can be used to deregister
		the request again. See also Registration#id.
	**/
	extern var id : Null<String>;
	/**
		```lua
		(field) lsp.NotebookDocumentSyncRegistrationOptions.notebookSelector: (lsp.NotebookDocumentFilterWithCells|lsp.NotebookDocumentFilterWithNotebook)[]
		```
		
		---
		
		
		The notebooks to be synced
	**/
	extern var notebookSelector : Array<haxe.extern.EitherType<externs.type.Lsp_NotebookDocumentFilterWithNotebook, externs.type.Lsp_NotebookDocumentFilterWithCells>>;
	/**
		```lua
		(field) lsp.NotebookDocumentSyncRegistrationOptions.save: boolean?
		```
		
		---
		
		
		Whether save notification should be forwarded to
		the server. Will only be honored if mode === `notebook`.
	**/
	extern var save : Null<Bool>;
}