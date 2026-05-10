all: install

SRC_DIR=src
OUT_DIR=externs

EXTERNAL_SOURCES_DIR=external/anydev.nvim/out
EXTERNAL_SOURCES=$(shell find $(EXTERNAL_SOURCES_DIR) -type f -name "*.json")

SOURCES_DIR=$(SRC_DIR)/hxnvim/source
SOURCES := $(patsubst $(EXTERNAL_SOURCES_DIR)/%, $(SOURCES_DIR)/%, $(EXTERNAL_SOURCES))

$(SOURCES_DIR)/%: $(EXTERNAL_SOURCES_DIR)/%
	@mkdir -p $(dir $@)
	cp $< $@

.PHONY=sources
sources: $(SOURCES)

.PHONY=build
build: sources
	@haxe build.hxml
	# @cp -r $(RESOURCES_DIR)/_internal $(OUT_DIR)/

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
	@rm -rf $(SOURCES_DIR)

