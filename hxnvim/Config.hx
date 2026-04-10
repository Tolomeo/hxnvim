using utils.RunState;

typedef HxNvimConfig = {
	logLevel:Int,
	cacheDir:String,
	outputDir:String,
	inputDir:String,
	modules:Array<String>,
	overrides:Map<String, {
		?parsedProperty:String,
		?parsedMethod:String
	}>,
}

final Config:HxNvimConfig = {
	logLevel: 3,
	cacheDir: '.cache',
	outputDir: 'externs',
	inputDir: 'resources/types',
	modules: [
		'vim',
		'vim.api',
		'vim.bo',
		'vim.cmd',
		'vim.diagnostic',
		'vim.filetype',
		'vim.fn',
		'vim.fs',
		'vim.go',
		'vim.health',
		'vim.highlight',
		'vim.json',
		'vim.keymap',
		'vim.loop',
		'vim.lsp',
		'vim.opt',
		'vim.secure',
		'vim.treesitter',
		'vim.ui',
		'vim.version',
		'vim.wo'
	],
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
};
