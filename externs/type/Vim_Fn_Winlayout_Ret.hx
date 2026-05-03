package externs.type;

@:native("vim.fn.winlayout.ret") extern typedef Vim_Fn_Winlayout_Ret = haxe.extern.EitherType<externs.type.Vim_Fn_Winlayout_Leaf, haxe.extern.EitherType<externs.type.Vim_Fn_Winlayout_Branch, externs.type.Vim_Fn_Winlayout_Empty>>;