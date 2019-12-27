BISON_VERSION = 3.0.4
BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
BISON_SITE = https://ftp.gnu.org/gnu/bison/

BISON_DEPENDENCIES=m4

BISON_CONF_OPTS=

$(eval $(autotools-package))
