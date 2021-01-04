GST_PLUGINS_UGLY_VERSION = 1.18.2
GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
GST_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly

GST_PLUGINS_UGLY_DEPENDENCIES=gstreamer gst-plugins-base

GST_PLUGINS_UGLY_CONF_OPTS=

$(eval $(meson-package))
