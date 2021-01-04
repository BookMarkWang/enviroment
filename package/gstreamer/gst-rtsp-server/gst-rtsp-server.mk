GST_RTSP_SERVER_VERSION = 1.18.2
GST_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST_RTSP_SERVER_VERSION).tar.xz
GST_RTSP_SERVER_SITE = https://gstreamer.freedesktop.org/src/gst-rtsp-server

GST_RTSP_SERVER_DEPENDENCIES=gstreamer gst-plugins-base

GST_RTSP_SERVER_CONF_OPTS=

$(eval $(meson-package))
