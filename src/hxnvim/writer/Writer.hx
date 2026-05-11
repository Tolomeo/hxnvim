package hxnvim.writer;

import sys.FileSystem;
import sys.io.File;
import haxe.ds.Option;
import haxe.io.Path;
import hxnvim.Config;

private abstract FileRW(String) to String {
	public function new(path:String) {
		this = path;
	}

	public function read() {
		return switch (FileSystem.exists(this)) {
			case true: Some(File.getContent(this));
			case false: None;
		}
	}

	public function write(content:String) {
		final handle = File.write(this, false);
		handle.writeString(content);
		handle.close();
	}
}

class Writer {
	final rootDir:String;

	public function new(dir) {
		final root = Path.join([Config.outputDir, dir]);
		FileSystem.createDirectory(root);
		this.rootDir = root;
	}

	public function get(file:String) {
		return new FileRW(Path.join([this.rootDir, file]));
	}
}
