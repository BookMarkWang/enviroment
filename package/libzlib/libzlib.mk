LIBZLIB_VERSION = 1.2.11
LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
LIBZLIB_SITE = http://www.zlib.net

LIBZLIB_DEPENDENCIES=

LIBZLIB_CONF_ENV = CFLAGS="-fPIC"

LIBZLIB_CONF_OPTS = --shared

$(eval $(autotools-package))
