GSTREAMER_VERSION = 1.18.2
GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
GSTREAMER_SITE = https://gstreamer.freedesktop.org/src/gstreamer

GSTREAMER_DEPENDENCIES=bison flex libglib2

GSTREAMER_CONF_OPTS=

$(eval $(meson-package))
