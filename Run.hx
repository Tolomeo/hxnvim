import haxe.io.Path;
import hxargs.Args;
import hxnvim.HxNvim;

class Run {
	public static function main() {
		final args = Sys.args();

		final cwd = args.pop();
		final config:Dynamic<Dynamic> = {};
		config.outputDir = cwd;

		var help = true;
		final argsParser = Args.generate([
			@doc("Parent directory of the generated externs")
			["--dir"] => function(dir:String) {
				config.outputDir = Path.join([cwd, dir]);
			},
			@doc("Parent package of the generated externs")
			["--pack"] => function(pack:String) {
				config.outputPack = pack;
			},
			@doc("Prints all passed flags and usage documentation")
			["--help"] => function() {
				help = true;
			}
		]);

		try {
			argsParser.parse(args);
		} catch (e:Any) {
			Sys.stderr().writeString(e + "\n");
			Sys.stderr().writeString(argsParser.getDoc() + "\n");
			Sys.exit(1);
		}

		if (help) {
			Sys.stderr().writeString("Config: " + config + "\n");
			Sys.stderr().writeString(argsParser.getDoc() + "\n");
			Sys.exit(0);
		}

		return HxNvim.run(config);
	}
}
