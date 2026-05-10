package hxnvim.transpiler;

enum abstract Target(String) {
	var Type;
	var Module;
	var Namespace;
}

typedef Input = {
	file:String,
	spec:String
}

typedef Output = {
	name:String,
	native:String,
	pack:Array<String>,
	overrides:{
		?parsedProperty:String, ?parsedMethod:String
	}
}

typedef IO = {
	target:Target,
	input:Input,
	output:Output
}
