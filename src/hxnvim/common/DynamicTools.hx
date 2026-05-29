package hxnvim.common;

import haxe.DynamicAccess;

// https://github.com/dubspeed/mergejson/blob/main/mergejson/MergeJson.hx
function merge(left:Dynamic, right:Dynamic, ?callback:(key:String, leftVal:Dynamic, rightVal:Dynamic) -> Dynamic) {
	var result:DynamicAccess<Dynamic> = left;

	for (key in Reflect.fields(right)) {
		var rightVal:Dynamic = Reflect.field(right, key);
		var leftVal:Dynamic = Reflect.field(left, key);

		// if the right key does not exist left, then merge without asking
		// else ask for a custom resolve, or use default rules
		if (Reflect.field(left, key) == null) {
			result[key] = rightVal;
			continue;
		}

		if (callback != null) {
			var custom:Dynamic = callback(key, leftVal, rightVal);
			if (custom != null) {
				result[key] = custom;
				continue;
			}
		}

		if (Std.is(rightVal, Array) || Std.is(rightVal, Bool) || Std.is(rightVal, Float) || Std.is(rightVal, Int) || Std.is(rightVal, String)) {
			result[key] = rightVal;
		} else {
			result[key] = merge(Reflect.field(left, key), rightVal);
		}

		/* // default rules, as documented
				  if (Std.is(rightVal, Array)) {
			// All arrays get merged
			// { a: [1]} && {a: [2,3]} => {a: [1,2,3]}
			var left:Array<Dynamic> = Reflect.field(left, key);
			var val:Array<Dynamic> = rightVal;
			result[key] = left.concat(val);
				  } else if (Std.is(rightVal, Bool) || Std.is(rightVal, Float) || Std.is(rightVal, Int) || Std.is(rightVal, String)) {
			// All "basic types" get overwritten
			// { a: 3 } && { a: 4 } => {a: 4}
			result[key] = rightVal;
				  } else {
			// all is left is {}, so we recursivly parse down
			result[key] = mergeJson(Reflect.field(left, key), rightVal);
		}*/
	}

	return result;
}
