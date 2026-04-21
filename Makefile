all: install

SRC_DIR=resources/types
OUT_DIR=externs

$(SRC_DIR):
	@mkdir -p $(SRC_DIR)
	@cp -r external/anydev.nvim/out/* $(SRC_DIR)/

.PHONY=src
src: $(SRC_DIR)

.PHONY=build
build: src
	@haxe build.hxml

.PHONY=rebuild
rebuild: clean
	@$(MAKE) build

.PHONY=install
install:
	@echo "Initialising submodules"
	@git submodule update --init --recursive
	@echo "Installing json type sources"
	@$(MAKE) src
	@echo "Installing dependencies"
	haxelib newrepo
	haxelib install --always build.hxml

.PHONY=clean
clean:
	@rm -rf $(OUT_DIR)
	@rm -rf $(SRC_DIR)

