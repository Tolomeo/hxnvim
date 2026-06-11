SRC_DIR=src
OUT_DIR=$(SRC_DIR)/externs

EXTERNAL_SOURCES_DIR:=external/anydev.nvim/out
EXTERNAL_SOURCES=$(shell find $(EXTERNAL_SOURCES_DIR) -type f -name "*.json")

SOURCES_DIR=$(SRC_DIR)/hxnvim/source/runtime
SOURCES:=$(patsubst $(EXTERNAL_SOURCES_DIR)/%, $(SOURCES_DIR)/%, $(EXTERNAL_SOURCES))

define HAXE
	docker run --rm \
		--volume "$(shell pwd)":/src \
		--workdir /src \
		haxe:4.3-alpine sh -c "$(strip $(1))"
endef

all: install

$(SOURCES_DIR)/%: $(EXTERNAL_SOURCES_DIR)/%
	@mkdir -p $(dir $@)
	cp $< $@

.PHONY=sources
sources: $(SOURCES)

.PHONY=build
build: sources
	@$(call HAXE, haxe build.hxml)

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
	@$(call HAXE, haxelib newrepo && haxelib install --always build.hxml)
	@$(MAKE) sources

.PHONY=clean
clean:
	@rm -rf $(OUT_DIR)
