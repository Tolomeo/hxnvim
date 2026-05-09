package;

import haxe.Exception;
import Reflect;

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

class Config {
	public static var logLevel:Int = 3;
	public static var outputDir:String = "externs";
	public static var outputPack:String = "externs";
	public static var inputDir:String = "resources/types";
	public static var overrides:Map<String, {
		?parsedProperty:String,
		?parsedMethod:String
	}> = [
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
		];

	public static function set(values:Dynamic<Dynamic>) {
		for (field in Reflect.fields(values)) {
			final value = Reflect.field(values, field);

			switch (Reflect.field(Config, field)) {
				case null:
					throw new Exception('Error setting config value named "${field}": not found');
				case current if (Type.enumConstructor(Type.typeof(current)) != Type.enumConstructor(Type.typeof(value))):
					throw new Exception('Error settings config value named "${field}": type mismatch');
				case _:
					Reflect.setField(Config, field, value);
			}
		}
	}
}
