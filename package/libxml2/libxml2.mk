LIBXML2_VERSION = 2.9.2
LIBXML2_SITE =ftp://xmlsoft.org/libxml2
LIBXML2_SOURCE =libxml2-$(LIBXML2_VERSION).tar.gz

LIBXML2_DEPENDENCIES=

LIBXML2_CONF_OPTS=

$(eval $(autotools-package))
