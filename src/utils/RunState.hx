package utils;

import haxe.ds.Option;
import haxe.Serializer;
import haxe.Unserializer;

private function serialize<T>(value:T):String {
	return Serializer.run(value);
}

private function unserialize<T>(value:String):T {
	return Unserializer.run(value);
}

private function clone<T>(value:T):T {
	return unserialize(serialize(value));
}

class RunState<T> {
	private var current:Option<T>;

	public function new(?defaultValue:T) {
		this.current = switch (defaultValue) {
			case null: None;
			case value: Some(clone(value));
		};
	}

	public function provide<R>(value:T, callback:() -> R) {
		final previous = this.current;

		this.current = Some(clone(value));

		final runResult = callback();

		this.current = previous;

		return runResult;
	}

	public function fork<R>(value:T->T, callback:() -> R) {
		final previous = this.current;

		this.current = switch (this.current) {
			case None: throw 'Cannot access an uninitialised run state value';
			case Some(state): Some(value(clone(state)));
		}

		final runResult = callback();

		this.current = previous;

		return runResult;
	}

	// NB consume doesn't clone the state for performance reasons
	// it could be unadvertedly changed, causing cryptic bugs
	// TODO: find a way to pass T to the callback as a readonly type
	public function consume<R>(callback:T->R) {
		final stateValue = switch (this.current) {
			case None: throw 'Cannot access an uninitialised run state value';
			case Some(value): value;
		}

		return callback(stateValue);
	}
}
