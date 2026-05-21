package hxnvim;

import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import haxe.Exception;
import haxe.macro.Context;

using hxnvim.common.NullTools;
using hxnvim.common.StringTools;
using hxnvim.common.ArrayTools;

import hxnvim.Config;
import hxnvim.Logger;
import hxnvim.transpiler.Transpiler;
import hxnvim.target.Target;

final sourcesPath = Context.resolvePath("hxnvim/source");
final helperSourcesPath = Context.resolvePath("hxnvim/source/helper");
final runtimeSourcesPath = Context.resolvePath("hxnvim/source/runtime");

class HxNvim {
	static function source(directory:String, ?relativeTo:String):Map<String, String> {
		Logger.info('Sourcing ${directory} files');

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

		HxNvim.processHelpers();
		HxNvim.processNamespaces();
		HxNvim.processModules();
		HxNvim.processAnnotations();
	}

	static function processHelpers() {
		Logger.info('Processing helpers');

		final helpers = HxNvim.source(helperSourcesPath, sourcesPath);

		for (file => fileContent in helpers.keyValueIterator()) {
			final target = Target.create(TargetType.Helper, file, fileContent);

			if (target.file.exists()) {
				Logger.info('Using "${target.file}" generated output found');
				continue;
			}

			final content = ['package ${target.output.pack};', fileContent].join("\n\n");

			Logger.info('Writing "${target.file}" output');
			target.file.write(content);
		}
	}

	static function processNamespaces() {
		Logger.info('Processing namespaces');

		final namespaces = HxNvim.source(runtimeSourcesPath);

		for (file => spec in namespaces.keyValueIterator()) {
			final target = Target.create(TargetType.Namespace, file, spec);

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

	static function processModules() {
		Logger.info('Processing modules');

		final modules = HxNvim.source(Path.join([runtimeSourcesPath, 'module']), runtimeSourcesPath);

		for (file => spec in modules.keyValueIterator()) {
			final target = Target.create(TargetType.Module, file, spec);

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

	static function processAnnotations() {
		Logger.info('Processing annotations');

		final annotations = HxNvim.source(Path.join([runtimeSourcesPath, 'type']), runtimeSourcesPath);

		for (file => spec in annotations.keyValueIterator()) {
			final target = Target.create(TargetType.Annotation, file, spec);

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
