BUILD_DIR=/home/wangyang/study/enviroment/build
INSTALL_DIR=/home/wangyang/3rdparty

TARGETS_FORMAT:=
TARGETS_NORMAL:=

define autotools_package2
	$(eval MK_PATH := $(lastword $(MAKEFILE_LIST)))
	$(eval MK_BASE := $(shell basename -s .mk $(MK_PATH)))
	$(eval MK_BASE_UPPER := $(shell echo $(MK_BASE)  | tr '[a-z]' '[A-Z]'))
	$(eval MK_BASE_UPPER_NAME := $(subst -,_, $(MK_BASE_UPPER)))
	TARGETS_FORMAT+= $(MK_BASE_UPPER_NAME)
	TARGETS_NORMAL+= $(MK_BASE)
	$(eval $(MK_BASE_UPPER_NAME)_DIR := $(abspath $(MK_PATH)/..))
endef

r_handle_package=$(foreach d,$($1_DEPENDENCIES), $(call r_handle_package,$(strip $(subst -,_, $(shell echo $d | tr '[a-z]' '[A-Z]'))))) $(call handle_item,$1)

export PKG_CONFIG_PATH=$(INSTALL_DIR)/lib/pkgconfig:/usr/lib/pkgconfig

#ffmpeg always has a Makefile, so now we use config.h to check whether project has been built, but some project has no config.h so add an empty after build
define handle_item

	$(eval BUILD_PATH := $(BUILD_DIR)/$(firstword $(subst .tar, ,$($1_SOURCE))))
	$(eval PATCH_FILES := $(strip $(wildcard $($1_DIR)/*.patch)))

	@if test -f $(BUILD_DIR)/$($1_SOURCE) ; then : ; \
		else wget $($1_SITE)/$($1_SOURCE) --directory-prefix=$(BUILD_DIR) >>/dev/null ; \
		fi ; 

	@if test -d  $(BUILD_PATH); then : ; \
		else tar -xvf $(BUILD_DIR)/$($1_SOURCE) -C $(BUILD_DIR) ; for i in $(PATCH_FILES); do cd $(BUILD_PATH) && patch -p1 < $$i; done ; fi ; 

	@if test -f $(BUILD_PATH)/config.h ; \
		then : ; \
		else cd $(BUILD_PATH) && ./configure $($1_CONF_OPTS) --prefix=$(INSTALL_DIR) && make && make install ; \
		fi ; 

	@if test -f $(BUILD_PATH)/config.h ; \
		then : ; \
		else touch $(BUILD_PATH)/config.h ; \
		fi ;
endef

autotools-package=$(call autotools_package2)

include package/*/*.mk

autotools_target :
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(INSTALL_DIR)
	$(foreach item,$(TARGETS_FORMAT), $(call r_handle_package,$(item)))

$(TARGETS_NORMAL) :
	$(eval BUILD_TARGET := $(subst -,_, $(shell echo $@  | tr '[a-z]' '[A-Z]')))
	$(call r_handle_package,$(BUILD_TARGET))

clean:
	@rm -rf $(BUILD_DIR)
