package transpiler;

import Logger;
import utils.RunState;
import transpiler.IO;

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

typedef ModuleConfig = {
	input:Input,
	output:Output,
	logs:Array<String>,
	/* lexedGenerics:Array<String>,
	parsedGenerics:Map<String, String> */
}

final State = new RunState<ModuleConfig>();
