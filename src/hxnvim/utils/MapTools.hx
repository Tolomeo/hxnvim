package hxnvim.utils;

function merge<K, T>(map1:Map<K, T>, map2:Map<K, T>) {
	final merged = map1.copy();

	for (key => value in map2) {
		merged[key] = value;
	}

	return merged;
}

function size<K, T>(map:Map<K, T>) {
	var count = 0;

	for (_ in map.keys()) {
		count++;
	}

	return count;
}

function pull<K, T>(map:Map<K, T>, key:K) {
	final pulled = map.get(key);
	map.remove(key);
	return pulled;
}
