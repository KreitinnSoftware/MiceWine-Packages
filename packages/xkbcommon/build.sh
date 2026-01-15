PKG_VER=1.10.0
PKG_CATEGORY="Core"
SRC_URL=https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-$PKG_VER.tar.gz
MESON_ARGS="-Denable-tools=false -Denable-wayland=false -Denable-bash-completion=false"
DEPENDENCIES="xorgproto xkeyboard-config libxml2 libxcb"
