#!/bin/bash
export PREFIX=/data/data/com.micewine.emu/files/usr
export INIT_DIR=$PWD
export GIT_SHORT_SHA=$(git rev-parse --short HEAD)

if [ ! -d "$INIT_DIR/built-pkgs" ]; then
  echo "built-pkgs: Don't Exist. Run 'build-all.sh' for generate the required packages for creating a core package for MiceWine."
  exit 0
fi

export ALL_PKGS=$(find "$INIT_DIR/built-pkgs" -name "*.rat" | sort)

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

mkdir -p /tmp/$RAND_VAL

cd /tmp/$RAND_VAL

for i in $ALL_PKGS; do
  resolvedPath=$(resolvePath "$i")

  if [ -n "$resolvedPath" ]; then
    tar -xf "$resolvedPath" pkg-header

    packageCategory=$(getElementFromHeader 2)

    if [ "$packageCategory" != "Core" ] && [ "$packageCategory" != "Devel" ]; then
      mv "$resolvedPath" "$INIT_DIR/components"
    fi
  fi
done

cd "$INIT_DIR"

rm -rf /tmp/$RAND_VAL
