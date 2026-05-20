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
	nativeChild:Array<String>,
	name:String,
	pack:String,
	overrides:Override
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

		final inputPath = new Path(input.file);

		final luaModule = inputPath.file;
		final luaModuleHierarchy = luaModule.split(".");

		final haxeType = luaModuleHierarchy.last().toTypeName();
		var haxeParentHierarchy = luaModuleHierarchy.initial().map(p -> p.toLowerCase().toIdentifierName());
		haxeParentHierarchy = switch (inputPath.dir) {
			case null: [Config.outputPack].concat(haxeParentHierarchy);
			case dir: [Config.outputPack].concat(dir.split("/").concat(haxeParentHierarchy));
		}
		final haxePackage = haxeParentHierarchy.join(".");

		final overrides = switch (Config.overrides.get(luaModule)) {
			case null: {};
			case moduleOverrides: moduleOverrides;
		}

		final output = {
			type: type,
			native: luaModule,
			nativeChild: [],
			name: haxeType,
			pack: haxePackage,
			overrides: overrides
		}

		final haxeOutputFile = '${haxeType}.hx';
		final outputPath = Path.join([Config.outputDir].concat(haxeParentHierarchy).concat([haxeOutputFile]));
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
		output.name = name.toTypeName();
		output.nativeChild.push(name);

		final nativeFullPath = [output.native].concat(output.nativeChild).join(".");
		output.overrides = switch (Config.overrides.get(nativeFullPath)) {
			case null: {};
			case moduleOverrides: moduleOverrides;
		}

		final file = this.file;
		return new Target(input, output, file);
	}

	public function toString() {
		return 'Target<${this.output}>';
	}
}
