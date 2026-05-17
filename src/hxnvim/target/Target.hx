package hxnvim.target;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

using hxnvim.utils.ArrayTools;
using hxnvim.utils.StringTools;

import hxnvim.Config;

private typedef TargetInput = {
	file:String,
	spec:String
};

private typedef TargetOutput = {
	type:TargetType,
	native:String,
	name:String,
	pack:Array<String>,
	overrides:{?parsedProperty:Null<String>, ?parsedMethod:Null<String>}
};

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

enum abstract TargetType(String) {
	var Annotation;
	var Module;
	var Namespace;
	var Helper;
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

	static public function create(type:TargetType, file:String, spec:String) {
		final input = {file: file, spec: spec};

		final inputFilePath = new Path(input.file);
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

		final output = {
			type: type,
			native: nativeName,
			name: outputTypeName,
			pack: outputPackage,
			overrides: outputOverrides
		}

		final outputPath = Path.join([Config.outputDir].concat(outputPackage).concat(['${outputTypeName}.hx']));
		final file = new TargetFile(outputPath);

		return new Target(input, output, file);
	}

	public final input:TargetInput;

	public final output:TargetOutput;

	public final file:TargetFile;

	public function new(input:TargetInput, output:TargetOutput, file:TargetFile) {
		this.input = input;
		this.output = output;
		this.file = file;
	}

	public function child(name:String, spec:String) {
		final input = Reflect.copy(this.input);
		input.spec = spec;

		final output = Reflect.copy(this.output);
		output.native = '${output.native}.${name}';
		output.name = name.toTypeName();

		final file = this.file;
		return new Target(input, output, file);
	}
}
