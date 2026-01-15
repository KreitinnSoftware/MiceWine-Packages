PKG_VER=2024.1
PKG_CATEGORY="Core"
SRC_URL=https://xorg.freedesktop.org/archive/individual/proto/xorgproto-2024.1.tar.xz
CONFIGURE_ARGS="--host=$TOOLCHAIN_TRIPLE host_alias=$TOOLCHAIN_TRIPLE"
DEPENDENCIES="xorg-utils-macros"
