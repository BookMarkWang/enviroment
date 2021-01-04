GST_PLUGINS_BASE_VERSION = 1.18.2
GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
GST_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base

GST_PLUGINS_BASE_DEPENDENCIES=gstreamer

GST_PLUGINS_BASE_CONF_OPTS=-Dtests=disabled -Dexamples=disabled

$(eval $(meson-package))
