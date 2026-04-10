package transpiler;

// TODO: REVISIT
typedef Input = {
	file: String,
	spec: String
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
	input:Input,
	output:Output
}
