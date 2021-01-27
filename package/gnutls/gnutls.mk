GNUTLS_VERSION_MAJOR = 3.7
GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).0
GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)

GNUTLS_DEPENDENCIES=pkgconf nettle

GNUTLS_CONF_ENV =

GNUTLS_CONF_OPTS=--with-included-unistring

$(eval $(autotools-package))
