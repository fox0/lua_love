#!/usr/bin/env bash

VERSION=`grep -o '[0-9]\{1,2\}\.[0-9]\{1,2\}\.[0-9]\{1,2\}' conf.lua`
NAME="dist/NamelessHero${VERSION}.love"

echo "Building ${NAME}"
mkdir dist
zip -u ${NAME} *.lua
zip -u ${NAME} src/*.lua
zip -u ${NAME} love2d_camera/*.lua
zip -u ${NAME} lua_logging/*.lua
zip -u -r ${NAME} resources
