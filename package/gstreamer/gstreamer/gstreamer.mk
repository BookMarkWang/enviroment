GSTREAMER_VERSION = 1.14.4
GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
GSTREAMER_SITE = https://gstreamer.freedesktop.org/src/gstreamer

GSTREAMER_DEPENDENCIES=

GSTREAMER_CONF_OPTS=

$(eval $(autotools-package))
