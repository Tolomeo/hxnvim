package externs.type;

extern typedef Vim_Filetype_Mapfn = (path:String, bufnr:Int) -> vim._internal.Multireturn<Null<String>, Null<(b:Int) -> Dynamic>>;