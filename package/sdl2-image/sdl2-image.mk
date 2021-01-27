SDL2_IMAGE_VERSION = 2.0.5
SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release

SDL2_IMAGE_DEPENDENCIES=pkgconf m4 libsdl 

SDL2_IMAGE_CONF_OPTS=

$(eval $(autotools-package))
