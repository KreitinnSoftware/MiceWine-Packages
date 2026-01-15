PKG_VER=2.3.7
PKG_CATEGORY="Core"
SRC_URL=https://mirrors.kernel.org/gnu/libidn/libidn2-$PKG_VER.tar.gz
CONFIGURE_ARGS="--host=$TOOLCHAIN_TRIPLE host_alias=$TOOLCHAIN_TRIPLE"
DEPENDENCIES="libunistring"
