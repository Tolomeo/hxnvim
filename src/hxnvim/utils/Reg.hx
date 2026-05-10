package hxnvim.utils;

using StringTools;
using hxnvim.utils.NullTools;

typedef RegOptions = {
	?global:Bool,
	?multiline:Bool,
	?anchored:Bool,
	?allowDuplicateGroupNames:Bool
};

// TODO: Conform to EReg interface
private class RegExp {
	public final pattern:String;

	public final options:RegOptions;

	public var pat(get, null):String;

	function get_pat() {
		var pat = this.pattern;

		if (this.options.anchored.or(false)) {
			pat = '^(?:${pat})$';
		}

		if (this.options.allowDuplicateGroupNames.or(true)) {
			pat = '(?J)${pat}';
		}

		return pat;
	}

	public var opt(get, null):String;

	function get_opt() {
		var opt = "";

		if (this.options.global.or(false)) {
			opt += "g";
		}

		if (this.options.multiline.or(false)) {
			opt += "m";
		}

		return opt;
	}

	var reg(get, null):EReg;

	function get_reg() {
		if (this.reg == null) {
			this.reg = new EReg(this.pat, this.opt);
		}

		return this.reg;
	}

	public function new(pattern:String, ?options:RegOptions) {
		this.pattern = pattern;
		this.options = options.or({});
		this.reg = null;
	}

	public function match(s:String) {
		return this.reg.match(s);
	}

	public function matchedRight() {
		return this.reg.matchedRight();
	}

	public function replace(s:String, by:String) {
		return this.reg.replace(s, by);
	}

	public function split(s:String) {
		return this.reg.split(s);
	}

	public function matched(n:Int) {
		return this.reg.matched(n);
	}

	public function matchLeftIterator(s:String) {
		final reg = this.reg;
		var source = s;

		final iterator:Iterator<(i:Int) -> String> = {
			hasNext: function() {
				return reg.match(source);
			},
			next: function() {
				source = reg.matchedRight();
				return reg.matched;
			}
		}

		return iterator;
	}
}

@:forward
abstract Reg(RegExp) {
	static public inline function escape(s:String) {
		return EReg.escape(s);
	}

	public function new(pattern:String, ?options:RegOptions) {
		this = new RegExp(pattern, options);
	}

	@:to
	public function toString() {
		return '(?:${this.pattern})';
	}

	@:from
	static public function fromString(s:String) {
		return new Reg(s);
	}

	public function copy(?optionsOverride:RegOptions) {
		final options = optionsOverride.or(this.options);

		return new Reg(this.pattern, options);
	}
}
