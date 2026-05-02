import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import haxe.Exception;
import haxe.ds.Option;

using utils.NullTools;
using utils.StringTools;
using utils.ArrayTools;

import Config;
import Logger;
import transpiler.Transpiler;
import writer.Writer;

class HxNvim {
	static public function main() {
		HxNvim.run();
	}

	static function source(?directory:String):Array<Map<String, String>> {
		final directory = directory.or(Config.inputDir);
		final files = new Map<String, String>();
		final subDirectories = new Array<String>();

		if (!FileSystem.exists(directory)) {
			throw new Exception('Source directory "${directory}" does not exists');
		}

		for (file in FileSystem.readDirectory(directory)) {
			final path = Path.join([directory, file]);

			if (sys.FileSystem.isDirectory(path)) {
				subDirectories.push(path);
				continue;
			}

			final spec = try {
				File.getContent(path);
			} catch (e:Exception) {
				Logger.error('Error sourcing file ${path}');
				throw e;
			}

			final relativePath = path.substr(Path.addTrailingSlash(Config.inputDir).length);
			files.set(relativePath, spec);
		}

		return [files].concat(subDirectories.flatMap(dir -> HxNvim.source(dir)));
	}

	static macro function run() {
		final outputDir = Config.outputDir;
		// final packages = [HxNvim.source(Config.inputDir), HxNvim.source('${Config.inputDir}/module')];
		final packages = HxNvim.source();

		for (specs in packages) {
			HxNvim.generate(specs);
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

	static function generate(specs:Map<String, String>) {
		for (file => spec in specs.keyValueIterator()) {
			final filepath = new Path(file);
			final native = filepath.file;
			final pack = switch (filepath.dir) {
				case null: [Config.outputPack];
				case dir: [Config.outputPack].concat(dir.split("/"));
			}
			final name = filepath.file.toTypeName();

			final targetDir = filepath.dir;
			final targetFile = '${name}.hx';
			final targetWriter = new Writer(targetDir).get(targetFile);

			switch (targetWriter.read()) {
				case None:
				case Some(_):
					Logger.info('Using "${Path.join([targetDir, targetFile])}" generated output found');
					continue;
			}

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
	}
}
