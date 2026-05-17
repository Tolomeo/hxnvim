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

		HxNvim.generateVimPackage(TargetType.Namespace, namespaces);

		final modules = HxNvim.source(Path.join([runtimeSourcesPath, 'module']), runtimeSourcesPath);

		HxNvim.generateVimPackage(TargetType.Module, modules);

		final types = HxNvim.source(Path.join([runtimeSourcesPath, 'type']), runtimeSourcesPath);

		HxNvim.generateVimPackage(TargetType.Annotation, types);
	}

	static function generateHelperPackage(filesources:Map<String, String>) {
		for (file => fileContent in filesources.keyValueIterator()) {
			final target = Target.create(TargetType.Helper, file, fileContent);

			if (target.file.exists()) {
				Logger.info('Using "${target.file}" generated output found');
				continue;
			}

			final content = ['package ${target.output.pack.join(".")};', fileContent].join("\n\n");

			Logger.info('Writing "${target.file}" output');
			target.file.write(content);
		}
	}

	static function generateVimPackage(type:TargetType, filesources:Map<String, String>) {
		for (file => spec in filesources.keyValueIterator()) {
			final target = Target.create(type, file, spec);

			if (target.file.exists()) {
				Logger.info('Using "${target.file}" generated output found');
				continue;
			}

			Logger.info('Traspiling "${file}"');

			final transpiled = new Transpiler(target).transpile();

			Logger.info('Writing "${target.file}" output');

			target.file.write(transpiled);
		}
	}
}
