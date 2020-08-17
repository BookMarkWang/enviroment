SDL2_MIXER_VERSION = 2.0.4
SDL2_MIXER_SOURCE = SDL2_mixer-$(SDL2_MIXER_VERSION).tar.gz
SDL2_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release

SDL2_MIXER_DEPENDENCIES=

SDL2_MIXER_CONF_OPTS=

$(eval $(autotools-package))
