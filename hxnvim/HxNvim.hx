/* import haxe.Exception;
	import sys.io.File;
	import hxjsonast.*;

	class HxNvim {
	static function readFile(path: String) {
		try {
			return File.getContent(path);
		} catch (e: Exception) {
			trace('Error reading file ${path}');
			throw e;
		}
	}

	static public function main() {
		final args = Sys.args();
		trace(args);
		final file = 'resources/types/vim.json';
		final fileContents = HxNvim.readFile(file);

		// parsing is easy!
		var json = hxjsonast.Parser.parse(fileContents, file);

		// `pos` store the filename, start and end characters
		trace(json.pos.file); // {file: 'person.json', min: 0, max: 43}

		// `value` is an enum, easy to work with pattern matching
		switch (json.value) {
			case JNull:
				trace('null!');
			case JString(string):
				trace('string!');
			case JBool(bool):
				trace('boolean!');
			case JNumber(number):
				trace('number!');
			case JArray(values):
				trace('array!');
			case JObject(fields):
				for (field in fields) {
					trace(field.name);
				}
		}
	}
}*/

// import haxe.ds.Option;
import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import haxe.Exception;
import haxe.ds.Option;

using utils.StringTools;
using utils.ArrayTools;

// using reader.ReaderTools;
import Config;
import Logger;
import transpiler.Transpiler;
import writer.Writer;

// import reader.Neodev;
// import reader.Runtime;
// import writer.Writer;
// import transpiler.Transpiler;
class HxNvim {
	static public function main() {
		HxNvim.run();
	}

	static function source(directory:String) {
		final entryFiles = new Map<String, String>();

		if (!FileSystem.exists(directory)) {
			Logger.error('"$directory" does not exists');
			return entryFiles;
		}

		for (file in FileSystem.readDirectory(directory)) {
			final path = haxe.io.Path.join([directory, file]);

			if (sys.FileSystem.isDirectory(path)) {
				continue;
			}

			final spec = try {
				File.getContent(path);
			} catch (e:Exception) {
				Logger.error('Error sourcing file ${path}');
				throw e;
			}

			entryFiles.set(path, spec);
		}

		return entryFiles;
	}

	static macro function run() {
		final outputDir = Config.outputDir;
		final specs = HxNvim.source(Config.inputDir);

		for (file => spec in specs.keyValueIterator()) {
			final filepath = new Path(file);
			final native = filepath.file;
			final pack = [filepath.file];
			final name = filepath.file.capitalize();

			final targetDir = pack.join('/');
			final targetFile = '${name}.hx';
			final targetWriter = new Writer(targetDir).get(targetFile);

			switch (targetWriter.read()) {
				case None:
				case Some(_):
					Logger.info('Using "${Path.join([targetDir, targetFile])}" generated output found');
					continue;
			}

			trace(filepath.file);
			trace(spec.length);

			final input = {
				file: file,
				spec: spec
			}

			final output = {
				name: name,
				pack: pack,
				native: native,
				overrides: switch (Config.overrides.get(native)) {
					case null: {};
					case moduleOverrides: moduleOverrides;
				}
			};

			final transpiled = Transpiler.transpile({
				input: input,
				output: output
			});

			Logger.info('Writing "${Path.join([targetDir, targetFile])}" output');
			targetWriter.write(transpiled);
		}

		/* for (moduleName in Config.modules) {
				final root = Config.outputDir;
				final path = moduleName.split(".");
				final pack = [root].concat(path);
				final name = path.last().capitalize();

				final dir = path.join('/');
				final file = '${name}.hx';
				final outputFile = new Writer(dir).get(file);

				switch (outputFile.read()) {
					case None:
					case Some(_):
						Logger.info('Using "${moduleName}" generated output found at ${outputFile}');
						continue;
				}

				final input = switch (HxNvim.source(moduleName)) {
					case None: throw '"${moduleName}" input source not found';
					case Some(source): {
							moduleName: moduleName,
							source: source
						};
				};

				final output = {
					pack: pack,
					moduleName: name,
					native: moduleName,
					overrides: switch (Config.overrides.get(moduleName)) {
						case null: {};
						case moduleOverrides: moduleOverrides;
					}
				};

				final transpiledModule = Transpiler.transpileModule({
					input: input,
					output: output
				});

				Logger.info('Writing "${output.native}" generated output at ${outputFile}');
				outputFile.write(transpiledModule);
			}

			return macro null; */
		return macro null;
	}
}
