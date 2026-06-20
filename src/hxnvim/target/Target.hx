package hxnvim.target;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

using hxnvim.common.ArrayTools;
using hxnvim.common.StringTools;

import hxnvim.Config;

private typedef TargetInput = {
	file:String,
	spec:String
};

private typedef TargetOutput = {
	native:String,
	nativeChild:Array<String>,
	qualifiedName:String,
	name:String,
	pack:String,
};

private typedef TargetOverride = Override;

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

		final inputPath = new Path(input.file);

		final inputModule = inputPath.file;
		final inputModuleHierarchy = inputModule.split(".");

		final outputName = inputModuleHierarchy.last().toTypeName();
		var outputParentHierarchy = inputModuleHierarchy.initial().map(p -> p.toLowerCase().toIdentifierName());
		outputParentHierarchy = switch (inputPath.dir) {
			case null: [Config.outputPack].concat(outputParentHierarchy);
			case dir: [Config.outputPack].concat(dir.split("/").concat(outputParentHierarchy));
		}
		final outputPackage = outputParentHierarchy.join(".");
		final qualifiedName = '${outputPackage}.${outputName}';

		final output = {
			native: inputModule,
			nativeChild: [],
			qualifiedName: qualifiedName,
			name: outputName,
			pack: outputPackage,
		}

		final overrides = switch (Config.overrides.get(inputModule)) {
			case null: {};
			case moduleOverrides: moduleOverrides;
		}

		final haxeOutputFile = '${outputName}.hx';
		final outputPath = Path.join([Config.outputDir].concat(outputParentHierarchy).concat([haxeOutputFile]));
		final file = new TargetFile(outputPath);

		return new Target(type, input, output, overrides, file);
	}

	public final type:TargetType;

	public final input:TargetInput;

	public final output:TargetOutput;

	public final overrides:TargetOverride;

	public final file:TargetFile;

	public function new(type:TargetType, input:TargetInput, output:TargetOutput, overrides:TargetOverride, file:TargetFile) {
		this.type = type;
		this.input = input;
		this.output = output;
		this.overrides = overrides;
		this.file = file;
	}

	public function createChild(childName:String, type:TargetType, file:String, spec:String) {
		final type = this.type;

		final input = Reflect.copy(this.input);
		input.file = file;
		input.spec = spec;

		final name = childName.toTypeName();
		final qualifiedName = '${output.qualifiedName}.${name}';

		final output = Reflect.copy(this.output);
		output.name = name;
		output.qualifiedName = qualifiedName;
		output.nativeChild.push(childName);

		final nativeFullPath = [output.native].concat(output.nativeChild).join(".");
		final overrides = switch (Config.overrides.get(nativeFullPath)) {
			case null: {};
			case moduleOverrides: moduleOverrides;
		}

		final file = this.file;
		return new Target(type, input, output, overrides, file);
	}

	public function toString() {
		return 'Target<${this.output}>';
	}
}
