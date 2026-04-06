all: install

resources/types:
	@mkdir -p resources/types
	@cp -r external/anydev.nvim/out/* resources/types/

.PHONY=types
types: resources/types

.PHONY=install
install:
	@echo "Initialising submodules"
	@git submodule update --init --recursive
	@echo "Installing json type sources"
	@$(MAKE) types

.PHONY=clean
clean:
	@rm -rf resources/types
