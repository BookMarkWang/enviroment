FLEX_VERSION = 2.6.0
FLEX_SOURCE=flex-$(FLEX_VERSION).tar.gz
FLEX_SITE = http://download.sourceforge.net/project/flex

FLEX_DEPENDENCIES=m4

FLEX_CONF_OPTS=

$(eval $(autotools-package))
