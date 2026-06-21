package hxnvim.transpiler.symbol;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;

import hxnvim.transpiler.symbol.Symbol;

function isNullable(type:LiteralType) {
	return switch (type) {
		case LiteralType.Optional(_): true;
		case LiteralType.Nil: true;
		case LiteralType.Void: true;
		case LiteralType.Union(unionTypes): unionTypes.exists(unionType -> isNullable(unionType));
		case LiteralType.Override(aliasType): aliasType.startsWith('Null<');
		case _: false;
	}
}

function is(type:LiteralType, name:String) {
	return Type.enumConstructor(type) == name;
}

function matches(a:LiteralType, b:LiteralType) {
	if (Type.getEnum(a) != Type.getEnum(b)) {
		return false;
	}

	return Type.enumIndex(a) == Type.enumIndex(b);
}
