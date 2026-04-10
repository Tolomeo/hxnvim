package utils;

using StringTools;

final replace = StringTools.replace;

final endsWith = StringTools.endsWith;

function capitalize(str:String) {
	return str.charAt(0).toUpperCase() + str.substr(1);
}

