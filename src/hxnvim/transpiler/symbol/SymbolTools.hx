package hxnvim.transpiler.symbol;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;

import hxnvim.transpiler.symbol.Symbol;

function isNullable(type:LiteralType) {
	return switch (type) {
		case LiteralType.Optional(_): true;
		case LiteralType.Builtin(value): ["nil", "void"].contains(value);
		case LiteralType.Union(unionTypes): unionTypes.exists(unionType -> isNullable(unionType));
		case LiteralType.Override(aliasType): aliasType.startsWith('Null<');
		case _: false;
	}
}

function is(type:LiteralType, name:String) {
	return Type.enumConstructor(type) == name;
}
