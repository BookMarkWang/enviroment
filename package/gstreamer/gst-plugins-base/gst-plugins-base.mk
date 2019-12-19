GST_PLUGINS_BASE_VERSION = 1.14.5
GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
GST_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base

GST_PLUGINS_BASE_DEPENDENCIES=gstreamer

$(eval $(autotools-package))