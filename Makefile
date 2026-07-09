DIST_DIR=dist
OUT_DIR=$(DIST_DIR)/nvim

JSON_EXTERNAL_SOURCES_DIR:=external/anydev.nvim/out
JSON_EXTERNAL_SOURCES=$(shell find $(JSON_EXTERNAL_SOURCES_DIR) -type f -name "*.json")
JSON_SOURCES_DIR=$(DIST_DIR)/source/runtime
JSON_SOURCES:=$(patsubst $(JSON_EXTERNAL_SOURCES_DIR)/%, $(JSON_SOURCES_DIR)/%, $(JSON_EXTERNAL_SOURCES))
TXT_SOURCES:=$(shell find $(DIST_DIR) -type f -name "*.txt")
HX_SOURCES:=$(shell find $(DIST_DIR) -type f -name "*.hx")

define HAXE
	docker run --rm \
		--volume "$(shell pwd)":/src \
		--workdir /src \
		haxe:4.3-alpine sh -c "$(strip $(1))"
endef

all: install

$(JSON_SOURCES_DIR)/%: $(JSON_EXTERNAL_SOURCES_DIR)/%
	@echo ":: Copying json file sources"
	@mkdir -p $(dir $@)
	cp $< $@

$(OUT_DIR)/.build: $(JSON_SOURCES) $(TXT_SOURCES) $(HX_SOURCES)
	@echo ":: Building externs"
	@$(MAKE) clean
	@$(call HAXE, haxe build.hxml)
	@touch $@

.PHONY=build
build: $(OUT_DIR)/.build

.PHONY=install
install:
	@echo ":: Initialising submodules"
	@git submodule update --init --recursive
	@echo ":: Installing json type sources"
	@$(MAKE) src
	@echo ":: Installing dependencies"
	@$(call HAXE, haxelib newrepo && haxelib install --always build.hxml)

.PHONY=clean
clean:
	@echo ":: Cleaning output files"
	@rm -rf $(OUT_DIR)
