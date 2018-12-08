#!/usr/bin/env bash

NAME='NamelessHero.love'
rm ${NAME}
zip -u ${NAME} *.lua
zip -u ${NAME} src/*.lua
zip -u ${NAME} lib/*.lua
zip -u ${NAME} resourses/fonts/Robotomedium.ttf
#zip -u ${NAME} resourses/textures/*
zip -u ${NAME} resourses/textures/rainbow*
