import haxe.io.Path;
import hxargs.Args;
import hxnvim.HxNvim;

class Run {
	public static function main() {
		final args = Sys.args();

		final cwd = args.pop();
		final config:Dynamic<Dynamic> = {};
		config.outputDir = cwd;
		
		final argsParser = Args.generate([
			@doc("Parent directory of the generated externs")
			["--dir"] => function(dir:String) {
				config.outputDir = Path.join([cwd, dir]);
			},
			@doc("Parent package of the generated externs")
			["--pack"] => function(pack:String) {
				config.outputPack = pack;
			}
		]);

		try {
			argsParser.parse(args);
		} catch (e:Any) {
			Sys.stderr().writeString(e + "\n");
			Sys.exit(1);
		}

		trace(config);
		trace(argsParser.getDoc());

		return HxNvim.run(config);
	}
}
