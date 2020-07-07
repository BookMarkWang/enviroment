FFMPEG_VERSION = 4.2.3
FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
FFMPEG_SITE = http://ffmpeg.org/releases

FFMPEG_DEPENDENCIES=yasm

FFMPEG_CONF_OPTS=--enable-shared

$(eval $(autotools-package))
