package externs.type;

/**
	```lua
	(class) lsp.NotebookDocumentFilterWithNotebook
	```
**/
@:structInit extern class Lsp_NotebookDocumentFilterWithNotebook {
	/**
		```lua
		(field) lsp.NotebookDocumentFilterWithNotebook.cells: lsp.NotebookCellLanguage[]?
		```
		
		---
		
		
		The cells of the matching notebook to be synced.
	**/
	extern var cells : Null<Array<externs.type.Lsp_NotebookCellLanguage>>;
	/**
		```lua
		(field) lsp.NotebookDocumentFilterWithNotebook.notebook: string|lsp.NotebookDocumentFilterNotebookType|lsp.NotebookDocumentFilterPattern|lsp.NotebookDocumentFilterScheme
		```
		
		---
		
		A notebook document filter denotes a notebook document by
		different properties. The properties will be match
		against the notebook's URI (same as with documents)
		
		
		---
		
		
		The notebook to be synced If a string
		value is provided it matches against the
		notebook type. '*' matches every notebook.
		
		---
		
		A notebook document filter where `notebookType` is required field.
		
		
		---
		
		A notebook document filter where `scheme` is required field.
		
		
		---
		
		A notebook document filter where `pattern` is required field.
		
	**/
	extern var notebook : haxe.extern.EitherType<String, externs.type.Lsp_NotebookDocumentFilter>;
}