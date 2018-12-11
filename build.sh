#!/usr/bin/env bash

NAME='dist/NamelessHero.love'

DIR=`dirname ${NAME}`
rm -rf ${DIR}
mkdir ${DIR}
zip ${NAME} *.lua
zip -u ${NAME} src/*.lua
zip -u ${NAME} lib/*.lua
zip -u -r ${NAME} resourses
