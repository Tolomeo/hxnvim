package hxnvim.target;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

using hxnvim.utils.ArrayTools;
using hxnvim.utils.StringTools;

import hxnvim.Config;

class Target {
	final srcPath:Path;
	final targetPath:Path;

	public final native:String;
	public final typePath:Array<String>;
	public final name:String;
	public final pack:Array<String>;
	public final dir:String;
	public final file:String;

	public function new(file:String) {
		this.srcPath = new Path(file);
		this.native = this.srcPath.file;

		final nativeTypePath = native.split(".");

		this.typePath = nativeTypePath.initial();
		this.name = nativeTypePath.last().toTypeName();

		this.pack = switch (this.srcPath.dir) {
			case null: [Config.outputPack];
			case dir: [Config.outputPack].concat(dir.split("/").concat(this.typePath));
		}

		this.dir = Path.join([Config.outputDir].concat(this.pack));
		this.file = '${name}.hx';

		this.targetPath = new Path(Path.join([this.dir, this.file]));
	}

	public function exists() {
		trace(this.targetPath);
		return FileSystem.exists(this.toString());
	}

	public function write(content:String) {
		FileSystem.createDirectory(this.targetPath.dir);
		final handle = File.write(this.toString(), false);
		handle.writeString(content);
		handle.close();
	}

	public function toString() {
		return this.targetPath.toString();
	}

	public function get() {
		return {
			native: this.native,
			pack: this.pack,
			dir: this.dir,
			file: this.file
		}
	}
}
