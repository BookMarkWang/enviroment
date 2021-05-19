PKGCONF_VERSION = 1.7.4
PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz

PKGCONF_DEPENDENCIES=

PKGCONF_CONF_OPTS=

$(eval $(autotools-package))
