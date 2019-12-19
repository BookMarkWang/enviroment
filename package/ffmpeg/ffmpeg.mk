FFMPEG_VERSION = 4.2.1
FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
FFMPEG_SITE = http://ffmpeg.org/releases

FFMPEG_DEPENDENCIES=

FFMPEG_CONF_OPTS=--enable-shared

$(eval $(autotools-package))