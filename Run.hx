import hxnvim.HxNvim;

class Run {
	public static function main() {
		return HxNvim.run({outputPack: 'nvim', outputDir: 'dist'});
	}
}
