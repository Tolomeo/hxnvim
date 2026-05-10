package hxnvim.utils;

import haxe.io.Path;
import sys.io.Process;
import utils.Result;

class Cmd {
	public static function executeCommand(cmd:String, ?args:Array<String>) {
		final command = new Process(cmd, args);
		return switch (command.exitCode(true)) {
			case 0:
				return Ok(command.stdout);
			case _:
				return Error(command.stderr.readAll().toString());
		}
	}

	static function getHomeFolder():String {
		return switch (Sys.systemName()) {
			case "Windows":
				Sys.getEnv("USERPROFILE");
			default:
				var home = Sys.getEnv("XDG_CONFIG_HOME");
				if (home == null) Sys.getEnv("HOME"); else home;
		}
	}
}
