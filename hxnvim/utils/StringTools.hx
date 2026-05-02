package utils;

using StringTools;

final replace = StringTools.replace;

final endsWith = StringTools.endsWith;

final startsWith = StringTools.startsWith;

function capitalize(str:String) {
	return str.charAt(0).toUpperCase() + str.substr(1);
}

