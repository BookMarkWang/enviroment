SDL2_TTF_VERSION = 2.0.14
SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release

SDL2_TTF_DEPENDENCIES=

SDL2_TTF_CONF_OPTS=

$(eval $(autotools-package))
