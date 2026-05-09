package utils;

import Sys;
import Config;

// https://www.dolthub.com/blog/2024-02-23-colors-in-golang/
private final colors = {
	reset: "\033[0m",
	red: "\033[31m",
	green: "\033[32m",
	yellow: "\033[33m",
	blue: "\033[34m",
	magenta: "\033[35m",
	cyan: "\033[36m",
	gray: "\033[37m",
	white: "\033[97m",
};

class Logger {
	private final scope:String;

	public function new(scope:String) {
		this.scope = scope;
	}

	public function suffix(scopeSuffix:String) {
		return new Logger('${this.scope}:${scopeSuffix}');
	}

	public function verbose(message:String, ?header:String) {
		final logLevel = Config.logLevel;

		if (logLevel < 4) {
			return;
		}

		var log = cyan('VERBOSE[${this.scope}]');

		log = switch (header) {
			case null: log;
			case h: '${log}(${h})';
		}

		log = '${log}: ${message}';

		Sys.println(log);
	}

	public function info(message:String, ?header:String) {
		final logLevel = Config.logLevel;

		if (logLevel < 3) {
			return;
		}

		var log = cyan('INFO[${this.scope}]');

		log = switch (header) {
			case null: log;
			case h: '${log}(${h})';
		}

		log = '${log}: ${message}';

		Sys.println(log);
	}

	public function warn(message:String, ?header:String) {
		final logLevel = Config.logLevel;
		if (logLevel < 2) {
			return;
		}

		var log = yellow('WARN[${this.scope}]');

		log = switch (header) {
			case null: log;
			case h: '${log}(${h})';
		}

		log = '${log}: ${message}';

		Sys.println(log);
	}

	public function error(message:String, ?header:String) {
		final logLevel = Config.logLevel;

		if (logLevel < 1) {
			return;
		}

		var log = red('ERROR[${this.scope}]');

		log = switch (header) {
			case null: log;
			case h: '${log}(${h})';
		}

		log = '${log}: ${message}';

		Sys.println(log);
	}

	public function assignmentInfo<T>(value:T, message:String) {
		this.info(message);
		return value;
	}

	public function assignmentWarn<T>(value:T, message:String) {
		this.warn(message);
		return value;
	}

	public function assignmentError<T>(value:T, message:String) {
		this.warn(message);
		return value;
	}

	public static function red(str:String) {
		return '${colors.red}${str}${colors.reset}';
	}

	public static function yellow(str:String) {
		return '${colors.yellow}${str}${colors.reset}';
	}

	public static function cyan(str:String) {
		return '${colors.cyan}${str}${colors.reset}';
	}

	public static function white(str:String) {
		return '${colors.cyan}${str}${colors.reset}';
	}
}
