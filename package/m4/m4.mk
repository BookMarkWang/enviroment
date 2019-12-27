M4_VERSION = 1.4.18
M4_SOURCE = m4-$(M4_VERSION).tar.xz
M4_SITE = https://ftp.gnu.org/gnu/m4/

M4_DEPENDENCIES=

M4_CONF_OPTS=

$(eval $(autotools-package))
