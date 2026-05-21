package hxnvim.transpiler;

import hxnvim.Logger;
import hxnvim.common.RunState;
import hxnvim.target.Target;

private final logger = Logger.suffix("Transpiler");

function info(msg:String) {
	return logger.info(msg, State.consume(state -> state.output.native));
}

function warn(msg:String) {
	return logger.warn(msg, State.consume(state -> state.output.native));
}

function error(msg:String) {
	return logger.error(msg, State.consume(state -> state.output.native));
}

function verbose(msg:String) {
	return logger.verbose(msg, State.consume(state -> state.output.native));
}

final State = new RunState<Target>();
