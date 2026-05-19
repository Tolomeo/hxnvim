package hxnvim.utils;

import haxe.Rest;

using Lambda;
using StringTools;

final replace = StringTools.replace;
final endsWith = StringTools.endsWith;
final startsWith = StringTools.startsWith;

function capitalize(str:String) {
	return str.charAt(0).toUpperCase() + str.substr(1);
}

function lTrimChars(str:String, chars:Rest<String>) {
	for (char in chars) {
		if (str.startsWith(char))
			return lTrimChars(str.substr(1), ...chars);
	}

	return str;
}

function rTrimChars(str:String, chars:Rest<String>) {
	for (char in chars) {
		if (str.endsWith(char))
			return rTrimChars(str.substr(0, str.length - 1), ...chars);
	}

	return str;
}

function trimChars(str:String, chars:Rest<String>) {
	return lTrimChars(rTrimChars(str, ...chars), ...chars);
}

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

function toSafeIdentifier(identifier:String) {
	return '${identifier}_';
}

function isReservedKeyword(name:String):Bool {
	return reservedKeyword.has(name);
}

function isGlobalType(name:String):Bool {
	return globalType.has(name);
}

function toTypeName(name:String) {
	var formattedName = name.split("_").map(a -> a.charAt(0).toUpperCase() + a.substr(1)).join("");
	formattedName = formattedName.split(".").map(a -> a.charAt(0).toUpperCase() + a.substr(1)).join("_");

	return switch (isGlobalType(formattedName)) {
		case false: sanitize(formattedName);
		case true: sanitize(toSafeIdentifier(formattedName));
	}
}

function toFieldName(name:String) {
	return switch (isReservedKeyword(name)) {
		case false: name;
		case true: toSafeIdentifier(name);
	};
}

function toIdentifierName(name:String) {
	return switch (isReservedKeyword(name)) {
		case false: name;
		case true: toSafeIdentifier(name);
	};
}

function eval(scriptString:String, ?variables:Map<String, Any>) {
	final scriptParser = new hscript.Parser();
	final scriptInterpreter = new hscript.Interp();
	final script = scriptParser.parseString(scriptString);

	if (variables == null) {
		return scriptInterpreter.execute(script);
	}

	for (variableName => variableValue in variables.keyValueIterator()) {
		scriptInterpreter.variables.set(variableName, variableValue);
	}

	return scriptInterpreter.execute(script);
}
