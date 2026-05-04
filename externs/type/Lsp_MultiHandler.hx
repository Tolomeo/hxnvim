package externs.type;

extern typedef Lsp_MultiHandler = (results:lua.Table<Int, { var err : Null<externs.type.Lsp_ResponseError>; var result : Any; }>, context:externs.type.Lsp_HandlerContext, config:lua.Table.AnyTable) -> Any;