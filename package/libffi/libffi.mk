LIBFFI_VERSION = 3.1
LIBFFI_SOURCE = libffi-$(LIBFFI_VERSION).tar.gz
LIBFFI_SITE = ftp://sourceware.org/pub/libffi

LIBFFI_DEPENDENCIES=

LIBFFI_CONF_OPTS=

$(eval $(autotools-package))