package hxnvim;

import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import haxe.Exception;
import haxe.macro.Context;

using hxnvim.utils.NullTools;
using hxnvim.utils.StringTools;
using hxnvim.utils.ArrayTools;

import hxnvim.Config;
import hxnvim.Logger;
import hxnvim.transpiler.Transpiler;
import hxnvim.transpiler.IO;
import hxnvim.writer.Writer;

final sourcesPath = Context.resolvePath("hxnvim/source");

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

			final relativePath = path.substr(Path.addTrailingSlash(sourcesPath).length);
			files.set(relativePath, spec);
		}

		return files;
	}

	static function run(?options:Dynamic<Dynamic>) {
		Config.set(options.or({}));

		final namespaces = HxNvim.source(sourcesPath);

		HxNvim.generate(Target.Namespace, namespaces);

		final modules = HxNvim.source(Path.join([sourcesPath, 'module']));

		HxNvim.generate(Target.Module, modules);

		final types = HxNvim.source(Path.join([sourcesPath, 'type']));

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

			trace("file", file);
			trace("targetDir", targetDir);

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
