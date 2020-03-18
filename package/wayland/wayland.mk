WAYLAND_VERSION = 1.6.0
WAYLAND_SITE = http://wayland.freedesktop.org/releases
WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz

WAYLAND_DEPENDENCIES=libffi wayland-protocols

WAYLAND_CONF_OPTS=--disable-documentation

$(eval $(autotools-package))

