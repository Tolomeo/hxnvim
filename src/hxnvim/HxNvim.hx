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
import hxnvim.target.Target;

final sourcesPath = Context.resolvePath("hxnvim/source");
final helperSourcesPath = Context.resolvePath("hxnvim/source/helper");
final runtimeSourcesPath = Context.resolvePath("hxnvim/source/runtime");

class HxNvim {
	static function source(directory:String, ?relativeTo:String):Map<String, String> {
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

			final relativePath = path.substr(Path.addTrailingSlash(relativeTo.or(directory)).length);
			files.set(relativePath, spec);
		}

		return files;
	}

	static function run(?options:Dynamic<Dynamic>) {
		Config.set(options.or({}));

		final helpers = HxNvim.source(helperSourcesPath, sourcesPath);

		HxNvim.generateHelperPackage(helpers);

		final namespaces = HxNvim.source(runtimeSourcesPath);

		HxNvim.generateVimPackage(ModuleType.Namespace, namespaces);

		final modules = HxNvim.source(Path.join([runtimeSourcesPath, 'module']), runtimeSourcesPath);

		HxNvim.generateVimPackage(ModuleType.Module, modules);

		final types = HxNvim.source(Path.join([runtimeSourcesPath, 'type']), runtimeSourcesPath);

		HxNvim.generateVimPackage(ModuleType.Type, types);
	}

	static function generateHelperPackage(filesources:Map<String, String>) {
		for (file => fileContent in filesources.keyValueIterator()) {
			final target = new Target(file);

			if (target.exists()) {
				Logger.info('Using "${target}" generated output found');
				continue;
			}

			final content = ['package ${target.pack.join(".")};', fileContent].join("\n\n");

			Logger.info('Writing "${target}" output');
			target.write(content);
		}
	}

	static function generateVimPackage(type:ModuleType, filesources:Map<String, String>) {
		for (file => spec in filesources.keyValueIterator()) {
			final target = new Target(file);

			if (target.exists()) {
				Logger.info('Using "${target}" generated output found');
				continue;
			}

			final input = {
				file: file,
				spec: spec
			}

			final output = {
				name: target.name,
				pack: target.pack,
				native: target.native,
				overrides: switch (Config.overrides.get(target.native)) {
					case null: {};
					case moduleOverrides: moduleOverrides;
				}
			};

			final transpiled = Transpiler.transpile({
				target: type,
				input: input,
				output: output
			});

			Logger.info('Writing "${target}" output');
			target.write(transpiled);
		}
	}
}
