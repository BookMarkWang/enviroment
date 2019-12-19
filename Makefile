BUILD_DIR=/home/wangyang/study/enviroment/build
INSTALL_DIR=/home/wangyang/3rdparty
LIST:=

define autotools_package2
	$1+=$(subst -,_, $(shell echo $(shell basename -s .mk $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))) | tr '[a-z]' '[A-Z]'))
endef

r_handle_package=$(foreach d,$($1_DEPENDENCIES), $(call r_handle_package,$(strip $(subst -,_, $(shell echo $d | tr '[a-z]' '[A-Z]')))))  $(call handle_item,$1)

export PKG_CONFIG_PATH=$(INSTALL_DIR)/lib/pkgconfig:/usr/lib/pkgconfig

define handle_item

	@if test -f $(BUILD_DIR)/$($1_SOURCE) ; then : ; \
		else wget $($1_SITE)/$($1_SOURCE) --directory-prefix=$(BUILD_DIR) >>/dev/null ; \
		fi ; 
	@if test -d $(BUILD_DIR)/$(shell basename -s .tar.xz $($1_SOURCE)) ; then : ; \
		else tar -xvf $(BUILD_DIR)/$($1_SOURCE) -C $(BUILD_DIR) >>/dev/null ; \
		fi ; 
	@if test -f $(BUILD_DIR)/$(shell basename -s .tar.xz $($1_SOURCE))/config.h ; \
		then : ; \
		else cd $(BUILD_DIR)/$(shell basename -s .tar.xz $($1_SOURCE)) && ./configure $($1_CONF_OPTS) --prefix=$(INSTALL_DIR) && make && make install ; \
		fi ; 
endef

autotools-package=$(call autotools_package2,LIST)

include package/*/*.mk

autotools_target:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(INSTALL_DIR)
	$(foreach item,$(LIST), $(call r_handle_package,$(item)))

clean:
	@rm -rf $(BUILD_DIR)
