PKG_VER=1.24.11
PKG_CATEGORY="Core"
SRC_URL=https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$PKG_VER.tar.xz
MESON_ARGS="-Dtests=disabled"
DEPENDENCIES="glib gst-plugins-base"
