PKG_VER=1.24.11
PKG_CATEGORY="Core"
SRC_URL=https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$PKG_VER.tar.xz
MESON_ARGS="-Dintrospection=disabled -Dcheck=disabled -Dtests=disabled -Dexamples=disabled "
MESON_ARGS+="-Dbenchmarks=disabled -Dlibunwind=disabled -Dlibdw=disabled -Dnls=disabled"
CFLAGS="-I$PREFIX/include"
LDFLAGS="-L$PREFIX/lib"
DEPENDENCIES="glib"
