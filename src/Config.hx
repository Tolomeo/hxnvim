using utils.RunState;

typedef HxNvimConfigValue = {
	logLevel:Int,
	cacheDir:String,
	outputDir:String,
	outputPack:String,
	inputDir:String,
	overrides:Map<String, {
		?parsedProperty:String,
		?parsedMethod:String
	}>,
}

@:forward
abstract HxNvimConfig(HxNvimConfigValue) {
	public function new(value:HxNvimConfigValue) {
		this = value;
	}
}

final Config = new HxNvimConfig({
	logLevel: 3,
	cacheDir: '.cache',
	outputDir: 'externs',
	outputPack: 'externs',
	inputDir: 'resources/types',
	overrides: [
		"vim.treesitter" => {},
		"vim.opt" => {
			parsedProperty: "{
				name: parsedProperty.name,
				doc: parsedProperty.doc,
				access: parsedProperty.access,
				meta: parsedProperty.meta,
				type:'externs.type.VimOption<' + parsedProperty.type + '>'
			}",
		}
	],
});
