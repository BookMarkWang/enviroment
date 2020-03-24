BUILD_DIR=$(CURDIR)/build
INSTALL_DIR=$(CURDIR)/install
MESON=meson

TARGETS_FORMAT:=
TARGETS_NORMAL:=

define prepare_package
	$(eval MK_PATH := $(lastword $(MAKEFILE_LIST)))
	$(eval MK_BASE := $(shell basename -s .mk $(MK_PATH)))
	$(eval MK_BASE_UPPER := $(shell echo $(MK_BASE)  | tr '[a-z]' '[A-Z]'))
	$(eval MK_BASE_UPPER_NAME := $(subst -,_, $(MK_BASE_UPPER)))
	TARGETS_FORMAT+= $(MK_BASE_UPPER_NAME)
	TARGETS_NORMAL+= $(MK_BASE)
	$(eval $(MK_BASE_UPPER_NAME)_DIR := $(abspath $(MK_PATH)/..))
	$(eval $(MK_BASE_UPPER_NAME)_TOOL := "$1")
	$(info "$(MK_BASE_UPPER_NAME)_TOOL=$1")
endef

r_handle_package=$(foreach d,$($1_DEPENDENCIES), $(call r_handle_package,$(strip $(subst -,_, $(shell echo $d | tr '[a-z]' '[A-Z]'))))) $(call handle_item,$1)

export PKG_CONFIG_PATH:=$(INSTALL_DIR)/lib/pkgconfig:${PKG_CONFIG_PATH}
export C_INCLUDE_PATH:=$(INSTALL_DIR)/include:$(C_INCLUDE_PATH)
export CPP_INCLUDE_PATH:=$(INSTALL_DIR)/include:$(CPP_INCLUDE_PATH)
export PATH:=$(INSTALL_DIR)/bin:${PATH}
export LD_LIBRARY_PATH:=$(INSTALL_DIR)/lib:$(LD_LIBRARY_PATH)
export LIBRARY_PATH:=$(INSTALL_DIR)/lib:$(LIBRARY_PATH)

export PKG_CONFIG:=$(INSTALL_DIR)/bin/pkgconf
export CC:=gcc
export CXX:=g++

#ffmpeg always has a Makefile, so now we use .build_complete to check whether project has been built
define handle_item

	$(info $($1_SITE)/$($1_SOURCE))
	@if test $($1_SOURCE) ; then if test ! -f $(BUILD_DIR)/$($1_SOURCE); then wget $($1_SITE)/$($1_SOURCE) --directory-prefix=$(BUILD_DIR) ; fi ; \
		else if test ! -f $(BUILD_DIR)/$($1_REAL_SOURCE); then wget $($1_SITE) --content-disposition --directory-prefix=$(BUILD_DIR) ; fi ; \
		fi ;
	$(eval $1_SOURCE:=$($1_SOURCE) $($1_REAL_SOURCE))
	$(eval $1_SOURCE:=$(firstword $(strip $($1_SOURCE))))

	$(eval BUILD_PATH := $(BUILD_DIR)/$(firstword $(subst .tar, ,$($1_SOURCE))))
	$(eval PATCH_FILES := $(strip $(wildcard $($1_DIR)/*.patch)))

	@if test ! -d  $(BUILD_PATH); then tar -xvf $(BUILD_DIR)/$($1_SOURCE) -C $(BUILD_DIR) ; for i in $(PATCH_FILES); do cd $(BUILD_PATH) && patch -p1 < $$i; done ; fi ;

	$(info $($1_TOOL))
	$(info $(BUILD_PATH))
	@if test -f $(BUILD_PATH)/.build_complete ; \
		then : ; \
		else if test $($1_TOOL) = meson ; then cd $(BUILD_PATH) && $(MESON) $($1_CONF_ENV) --prefix $(INSTALL_DIR) --libdir lib build && ninja -C build &&  $(MESON) install -C build ; else cd $(BUILD_PATH) && $($1_CONF_ENV) ./configure $($1_CONF_OPTS) --prefix=$(INSTALL_DIR) && make && make install ; fi ; \
		fi ; 

	@if test -f $(BUILD_PATH)/.build_complete ; \
		then : ; \
		else touch $(BUILD_PATH)/.build_complete ; \
		fi ;
endef

autotools-package=$(call prepare_package,autotools)

meson-package=$(call prepare_package,meson)


include package/*/*.mk

target :
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(INSTALL_DIR)
	$(foreach item,$(TARGETS_FORMAT), $(call r_handle_package,$(item)))

$(TARGETS_NORMAL) :
	$(eval BUILD_TARGET := $(subst -,_, $(shell echo $@  | tr '[a-z]' '[A-Z]')))
	$(call r_handle_package,$(BUILD_TARGET))

clean:
	@rm -rf $(BUILD_DIR)
