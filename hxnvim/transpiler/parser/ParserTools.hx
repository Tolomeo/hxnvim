package transpiler.parser;

import haxe.Exception;

using utils.ArrayTools;
using utils.StringTools;

import transpiler.parser.Parser.ParsedSymbol;

// TODO: list all identifiers with no package found here: https://api.haxe.org
private final globalType = ["Iterator"];

// TODO: list all identifiers found here: https://haxe.org/manual/expression.html#keywords
private final reservedKeyword = [
	"new",
	"while",
	"try",
	"throw",
	"return",
	"if",
	"else",
	"for",
	"do",
	"continue",
	"catch",
	"break",
	"function",
	"default",
	"default_"
];

// TODO: add elements to be sanitized to a separated map, like with reservedKeywords
function sanitize(name:String) {
	var sanitizedName = name;
	sanitizedName = sanitizedName.replace("+", "Plus");
	sanitizedName = sanitizedName.replace("#", "Hash");
	sanitizedName = sanitizedName.replace("/", "Slash");
	sanitizedName = sanitizedName.replace("\\", "BSlash");
	sanitizedName = switch sanitizedName.charCodeAt(0) {
		case s if (s >= '0'.code && s <= '9'.code): '_$sanitizedName';
		default: sanitizedName;
	}

	return sanitizedName;
}

function capitalize(str:String) {
	return str.charAt(0).toUpperCase() + str.substr(1);
}

function toSafeIdentifier(identifier:String) {
	return '${identifier}_';
}

function isReservedKeyword(name:String):Bool {
	return reservedKeyword.has(name);
}

function isGlobalType(name:String):Bool {
	return globalType.has(name);
}

function toDoc(lines:Array<String>):Array<String> {
	return lines.map(line -> line.replace("*/", "*\\/"));
}

class ParserTools {
	static public function getTable(symbol:ParsedSymbol) {
		return switch (symbol) {
			case ParsedSymbol.ParsedTable(table): table;
			case _: throw new Exception('Error extracting table symbol type from ${symbol}');
		}
	}

	static public function symbolName(symbol:ParsedSymbol):String {
		return switch (symbol) {
			case ParsedSymbol.ParsedTable(table): table.name;
			case _: throw new Exception('Unexpected parsed symbol type received: ${symbol}');
		}
	}

	static public function toTypeName(name:String) {
		var formattedName = name.split("_").map(a -> a.charAt(0).toUpperCase() + a.substr(1)).join("");
		formattedName = formattedName.split(".").map(a -> a.charAt(0).toUpperCase() + a.substr(1)).join("_");

		return switch (isGlobalType(formattedName)) {
			case false: sanitize(formattedName);
			case true: sanitize(toSafeIdentifier(formattedName));
		}
	}

	static public function toFieldName(name:String) {
		return switch (isReservedKeyword(name)) {
			case false: name;
			case true: toSafeIdentifier(name);
		};
	}

	static public function toIdentifierName(name:String) {
		return switch (isReservedKeyword(name)) {
			case false: name;
			case true: toSafeIdentifier(name);
		};
	}
}
