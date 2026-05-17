package hxnvim.target;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

using hxnvim.utils.ArrayTools;
using hxnvim.utils.StringTools;

import hxnvim.Config;

private class TargetFile {
	final path:Path;

	public function new(path:String) {
		this.path = new Path(path);
	}

	public function exists() {
		return FileSystem.exists(this.path.toString());
	}

	public function write(content:String) {
		FileSystem.createDirectory(this.path.dir);
		final handle = File.write(this.path.toString(), false);
		handle.writeString(content);
		handle.close();
	}

	public function toString() {
		return this.path.toString();
	}
}

class Target {
	static public function toHelperReference(reference:String) {
		return '${Config.outputPack}.helper.${reference}';
	}

	static public function toTypeReference(native:String) {
		final nativeTypePath = native.split(".");

		final typePath = nativeTypePath.initial().map(p -> p.toLowerCase().toIdentifierName());
		final name = nativeTypePath.last().toTypeName();

		return [Config.outputPack, 'type',].concat(typePath).concat([name]).join(".");
	}

	static public function toModuleReference(native:String) {
		final nativeTypePath = native.split(".");

		final typePath = nativeTypePath.initial().map(p -> p.toLowerCase());
		final name = nativeTypePath.last().toTypeName();

		return [Config.outputPack, 'module',].concat(typePath).concat([name]).join(".");
	}

	public final input:{
		file:String,
		spec:String
	}

	public final output:{
		native:String,
		name:String,
		pack:Array<String>,
		overrides:{?parsedProperty:Null<String>, ?parsedMethod:Null<String>}
	}

	public final file:TargetFile;

	public function new(file:String, spec:String) {
		this.input = {file: file, spec: spec};

		final inputFilePath = new Path(this.input.file);
		final nativeName = inputFilePath.file;
		final nativeTypePath = nativeName.split(".");
		final outputTypePath = nativeTypePath.initial().map(p -> p.toLowerCase().toIdentifierName());
		final outputTypeName = nativeTypePath.last().toTypeName();
		final outputPackage = switch (inputFilePath.dir) {
			case null: [Config.outputPack];
			case dir: [Config.outputPack].concat(dir.split("/").concat(outputTypePath));
		}
		final outputOverrides = switch (Config.overrides.get(nativeName)) {
			case null: {};
			case moduleOverrides: moduleOverrides;
		}

		this.output = {
			native: nativeName,
			name: outputTypeName,
			pack: outputPackage,
			overrides: outputOverrides
		}

		final outputPath = Path.join([Config.outputDir].concat(outputPackage).concat(['${outputTypeName}.hx']));
		this.file = new TargetFile(outputPath);
	}
}
