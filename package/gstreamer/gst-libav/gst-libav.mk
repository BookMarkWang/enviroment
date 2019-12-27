GST_LIBAV_VERSION = 1.14.4
GST_LIBAV_SOURCE = gst-libav-$(GST_LIBAV_VERSION).tar.xz
GST_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav

GST_LIBAV_DEPENDENCIES=gstreamer gst-plugins-base yasm

GST_LIBAV_CONF_OPTS =

$(eval $(autotools-package))
