package externs.type;

extern typedef Lsp_Handler = (err:Null<externs.type.Lsp_ResponseError>, result:Any, context:externs.type.Lsp_HandlerContext, config:lua.Table.AnyTable) -> Any;