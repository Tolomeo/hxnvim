package hxnvim;

import haxe.Exception;
import haxe.DynamicAccess;
import Reflect;

typedef Override = DynamicAccess<String>

class Config {
	public static var logLevel:Int = 3;
	public static var outputDir:String = "externs";
	public static var outputPack:String = "externs";
	public static var overrides:DynamicAccess<Override> = {
		/* "vim.treesitter": {},
			"vim.opt": {
				parsedProperty: "{
					name: parsedProperty.name,
					doc: parsedProperty.doc,
					access: parsedProperty.access,
					meta: parsedProperty.meta,
					type:'externs.type.VimOption<' + parsedProperty.type + '>'
				}",
		}*/
		/* "TSNode": {
			range: '{
				type: {
					generics: value.type.overloads[0].generics,
					arguments: value.type.overloads[0].arguments,
					returns: value.type.overloads[0].returns,
					overloads: []
				}
			}'
		} */
	};

	public static function set(values:Dynamic<Dynamic>) {
		for (field in Reflect.fields(values)) {
			final value = Reflect.field(values, field);

			switch (Reflect.field(Config, field)) {
				case null:
					throw new Exception('Error setting config value named "${field}": not found');
				case current:
					switch [
						Type.enumConstructor(Type.typeof(current)),
						Type.enumConstructor(Type.typeof(value))
					] {
						case [currentType, valueType] if (currentType != valueType):
							throw new Exception('Error setting config value named "${field}": type mismatch, wants "${currentType}", received "${valueType}"');
						case _:
							Reflect.setField(Config, field, value);
					}
			}
		}
	}
}
