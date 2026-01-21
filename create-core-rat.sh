#!/bin/bash
if [ $# -lt 1 ]; then
  echo "Specify Architecture for Building Core Package."
  exit 0
fi

if [ "$1" != "aarch64" ] && [ "$1" != "x86_64" ]; then
  echo "Invalid Architecture Specified, Available 'aarch64' and 'x86_64'"
  exit 0
fi

export PREFIX=/data/data/com.micewine.emu/files/usr
export INIT_DIR=$PWD
export ARCH=$1
export GIT_SHORT_SHA=$(git rev-parse --short HEAD)

if [ ! -d "$INIT_DIR/built-pkgs" ]; then
  echo "built-pkgs: Don't Exist. Run 'build-all.sh' for generate the required packages for creating a core package for MiceWine."
  exit 0
fi

export ALL_PKGS=$(find "$INIT_DIR/built-pkgs" -name "*$ARCH*.rat" | sort)

resolvePath()
{
  if [ -f "$1" ]; then
    echo "$1"
  elif [ -f "$INIT_DIR/$1" ]; then
    echo "$INIT_DIR/$1"
  fi
}

getElementFromHeader()
{
  echo "$(cat pkg-header | head -n $1 | tail -n 1 | cut -d "=" -f 2)"
}

export RAND_VAL=$RANDOM

mkdir -p "$INIT_DIR/components"
mkdir -p /tmp/$RAND_VAL

cd /tmp/$RAND_VAL

mkdir -p "files/wine-utils"
cp -rf "$INIT_DIR/common/"* "files/wine-utils"

touch new_makeSymlinks.sh

for i in $ALL_PKGS; do
  resolvedPath=$(resolvePath "$i")

  if [ -n "$resolvedPath" ]; then
    echo "Extracting '$(basename $resolvedPath)'..."

    tar -xf "$resolvedPath" pkg-header

    packageCategory=$(getElementFromHeader 2)

    if [ "$packageCategory" == "Core" ]; then
      tar -xf "$resolvedPath"
    fi

    if [ -f "makeSymlinks.sh" ]; then
      cat makeSymlinks.sh >> new_makeSymlinks.sh
      rm -f makeSymlinks.sh
    fi
  fi
done

mv new_makeSymlinks.sh makeSymlinks.sh

$INIT_DIR/tools/create-rat-pkg.sh "MiceWine-Core" "MiceWine Core" "" "$ARCH" "$GIT_SHORT_SHA" "Core" "$PWD" "$INIT_DIR/components"

cd "$INIT_DIR"

rm -rf /tmp/$RAND_VAL
