package externs.type;

@:native("vim.filetype.mapping.value") extern typedef Vim_Filetype_Mapping_Value = haxe.extern.EitherType<String, haxe.extern.EitherType<externs.type.Vim_Filetype_Mapfn, externs.type.Vim_Filetype_Maptbl>>;