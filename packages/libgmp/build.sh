PKG_VER=6.3.0
PKG_CATEGORY="Core"
SRC_URL=https://mirrors.kernel.org/gnu/gmp/gmp-$PKG_VER.tar.xz
CONFIGURE_ARGS="--host=$TOOLCHAIN_TRIPLE host_alias=$TOOLCHAIN_TRIPLE"
LDFLAGS="-L$PREFIX/lib"
