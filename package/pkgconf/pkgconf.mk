PKGCONF_VERSION = 1.0.1
PKGCONF_SITE = http://rabbit.dereferenced.org/~nenolod/distfiles
PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz

PKGCONF_DEPENDENCIES=

PKGCONF_CONF_OPTS=

$(eval $(autotools-package))
