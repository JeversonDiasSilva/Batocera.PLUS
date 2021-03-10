################################################################################
#
# LIBRETRO DUCKSTATION
#
################################################################################
# Version.: Commits on Feb 4, 2021
LIBRETRO_DUCKSTATION_VERSION = abb76310c4fcefb86fb72b08482c332492e70c27
LIBRETRO_DUCKSTATION_SITE = $(call github,libretro,duckstation,$(LIBRETRO_DUCKSTATION_VERSION))
LIBRETRO_DUCKSTATION_LICENSE = GPLv3
LIBRETRO_DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_DUCKSTATION_DEPENDENCIES = fmt boost ffmpeg sdl2

LIBRETRO_DUCKSTATION_CONF_OPTS  = -DBUILD_LIBRETRO_CORE=ON
LIBRETRO_DUCKSTATION_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIBRETRO_DUCKSTATION_CONF_OPTS += -DTHREADS_PTHREAD_ARG=ON
LIBRETRO_DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
LIBRETRO_DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DBUILD_SDL_FRONTEND=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DUSE_EGL=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DUSE_WAYLAND=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DUSE_X11=OFF

LIBRETRO_DUCKSTATION_CONF_ENV += LDFLAGS=-lpthread


define LIBRETRO_DUCKSTATION_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/duckstation_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro
endef

$(eval $(cmake-package))
