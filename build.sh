#!/usr/bin/env bash

NAME='dist/NamelessHero.love'

rm ${NAME}
zip ${NAME} *.lua
zip -u ${NAME} src/*.lua
zip -u ${NAME} lib/*.lua
zip -u -r ${NAME} resourses
