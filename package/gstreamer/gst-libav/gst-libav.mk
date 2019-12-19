GST_LIBAV_VERSION = 1.14.5
GST_LIBAV_SOURCE = gst-libav-$(GST_LIBAV_VERSION).tar.xz
GST_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav

GST_LIBAV_DEPENDENCIES=ffmpeg gstreamer gst-plugins-base

$(eval $(autotools-package))