import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import haxe.Exception;

using utils.NullTools;
using utils.StringTools;
using utils.ArrayTools;

import Config;
import Logger;
import transpiler.Transpiler;
import transpiler.IO;
import writer.Writer;

class HxNvim {
	static function source(directory:String):Map<String, String> {
		final files = new Map<String, String>();

		if (!FileSystem.exists(directory)) {
			throw new Exception('Source directory "${directory}" does not exists');
		}

		for (file in FileSystem.readDirectory(directory)) {
			final path = Path.join([directory, file]);

			if (sys.FileSystem.isDirectory(path)) {
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

		return files;
	}

	static function run(?options:Dynamic<Dynamic>) {
		Config.set(options);

		final namespaces = HxNvim.source(Config.inputDir);

		HxNvim.generate(Target.Namespace, namespaces);

		final modules = HxNvim.source(Path.join([Config.inputDir, 'module']));

		HxNvim.generate(Target.Module, modules);

		final types = HxNvim.source(Path.join([Config.inputDir, 'type']));

		HxNvim.generate(Target.Type, types);
	}

	static function generate(target:Target, specs:Map<String, String>) {
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
				target: target,
				input: input,
				output: output
			});

			Logger.info('Writing "${Path.join([targetDir, targetFile])}" output');
			targetWriter.write(transpiled);
		}
	}
}
