LIBSDL_VERSION = 2.0.12
LIBSDL_SOURCE = SDL2-$(LIBSDL_VERSION).tar.gz
LIBSDL_SITE = http://www.libsdl.org/release

LIBSDL_DEPENDENCIES=

LIBSDL_CONF_OPTS=

$(eval $(autotools-package))
