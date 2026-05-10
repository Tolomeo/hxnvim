package hxnvim.utils;

enum Result<T> {
	Ok(result:T);
	Error(message:String);
}
