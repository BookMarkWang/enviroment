FFMPEG_VERSION = 4.3
FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
FFMPEG_SITE = http://ffmpeg.org/releases

FFMPEG_DEPENDENCIES=yasm

FFMPEG_CONF_OPTS=--enable-shared --enable-libx264 --enable-gpl --enable-avresample

$(eval $(autotools-package))
