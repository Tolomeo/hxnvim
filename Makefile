all: install

RESOURCES_DIR=resources
SRC_DIR=$(RESOURCES_DIR)/types
OUT_DIR=externs

$(SRC_DIR):
	@mkdir -p $(SRC_DIR)
	@cp -r external/anydev.nvim/out/* $(SRC_DIR)/

.PHONY=src
src: $(SRC_DIR)

.PHONY=build
build: src
	@haxe build.hxml
	@cp -r $(RESOURCES_DIR)/_internal $(OUT_DIR)/

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

