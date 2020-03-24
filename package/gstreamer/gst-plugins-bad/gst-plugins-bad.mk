GST_PLUGINS_BAD_VERSION = 1.16.2
GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
GST_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad

GST_PLUGINS_BAD_DEPENDENCIES=gstreamer gst-plugins-base wayland

GST_PLUGINS_BAD_CONF_OPTS=

$(eval $(meson-package))
