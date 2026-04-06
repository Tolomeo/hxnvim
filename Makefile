all: install

resources/types:
	@mkdir -p resources/types
	@cp -r external/anydev.nvim/out/* resources/types/

.PHONY=types
types: resources/types

.PHONY=build
build:
	haxe build.hxml

.PHONY=install
install:
	@echo "Initialising submodules"
	@git submodule update --init --recursive
	@echo "Installing json type sources"
	@$(MAKE) types
	@echo "Installing dependencies"
	haxelib newrepo
	haxelib install --always build.hxml

.PHONY=clean
clean:
	@rm -rf resources/types
