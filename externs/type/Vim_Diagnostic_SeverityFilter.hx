package externs.type;

@:native("vim.diagnostic.SeverityFilter") extern typedef Vim_Diagnostic_SeverityFilter = haxe.extern.EitherType<externs.type.Vim_Diagnostic_Severity, haxe.extern.EitherType<Array<externs.type.Vim_Diagnostic_Severity>, { var min : externs.type.Vim_Diagnostic_Severity; var max : externs.type.Vim_Diagnostic_Severity; }>>;