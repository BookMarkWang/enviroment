GST_PLUGINS_GOOD_VERSION = 1.18.2
GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
GST_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good

GST_PLUGINS_GOOD_DEPENDENCIES=gstreamer gst-plugins-base

GST_PLUGINS_GOOD_CONF_OPTS=
GST_PLUGINS_GOOD_CONF_ENV = -Dtests=disabled -Dexamples=disabled

$(eval $(meson-package))
