#!/usr/bin/env bash

VERSION=`grep -o '[0-9]\{1,2\}\.[0-9]\{1,2\}\.[0-9]\{1,2\}' conf.lua`
NAME="dist/NamelessHero${VERSION}.love"

echo "Building ${NAME}"
zip -u ${NAME} *.lua
zip -u ${NAME} src/*.lua
zip -u ${NAME} lib/*.lua
zip -u -r ${NAME} resources
