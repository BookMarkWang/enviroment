YASM_VERSION = 1.3.0
YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
YASM_SITE = http://www.tortall.net/projects/yasm/releases

YASM_DEPENDENCIES=

YASM_CONF_OPTS =

$(eval $(autotools-package))
